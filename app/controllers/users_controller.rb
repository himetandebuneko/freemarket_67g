class UsersController < ApplicationController
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
end
