class UsersController < ApplicationController
  before_action :move_to_index, only: [:index, :show]

  def index
  end
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :lastname, :firstname, :lastnamekana, :firstnamekana, :birthday)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
