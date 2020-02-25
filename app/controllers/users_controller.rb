class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end 
    
  
  def task_params
    params.require(:task).permit(:content)
    params.require(:task).permit(:status)
  end
end