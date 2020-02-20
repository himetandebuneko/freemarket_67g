class SignupController < ApplicationController
  before_action :save_new_to_session, only: :step

  def new
    @user = User.new
    @user.build_address
  end

  def save_new_to_session
    session[:user_params] = user_params
    session[:address_attributes_after_new] = user_params[:address_attributes]
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes_after_new])
    redirect_to new_signup_path unless @user.valid?
  end 

  def step
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes_after_new])
    @user.build_address(user_params[:address_attributes])
    if @user.save
      sign_in(@user)
      redirect_to complete_signup_signup_index_path
    else
      redirect_to new_signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :lastname, 
      :firstname, 
      :lastnamekana, 
      :firstnamekana, 
      :birthday, 
      address_attributes: [:id, :postcode, :prefecture_id, :city, :housenumber, :housename, :phonenumber]
    )
  end
end