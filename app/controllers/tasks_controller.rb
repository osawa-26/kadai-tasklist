class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user

  def index
    if logged_in?
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(3)
    end
  end
  

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = '正常に入力されました'
      redirect_to root_url
    else
      @tasks = current_user.task.order.page(params[:page])
      flash.now[:danger] = '正常に入力されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    @tasks = current_user.tasks.update(task_params)
    if @task.save
      flash[:success] = '正常に入力されました'
      redirect_to @task
    else
      @tasks = current_user.task.order.page(params[:page])
      flash.now[:danger] = '正常に入力されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "削除されました"
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
