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
    # unless @user.valid?
    #   flash.now[:alert] = @user.errors.full_messages
    #   render :new and return
    # end
    render '/signup/new' unless @user.valid?
  end 

  def step
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(session[:address_attributes_after_new])  # ここでaddressモデルのsessionを引数で渡す。
    @user.build_address(user_params[:address_attributes])  # 今回のビューで入力された情報を代入。
    if @user.save
      session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていける。
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/new'
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
      address_attributes: [:id, :postcode, :prefectures, :city, :housenumber, :housename, :phonenumber]
    )
  end
end