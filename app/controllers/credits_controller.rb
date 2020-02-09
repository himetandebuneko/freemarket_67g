class CreditsController < ApplicationController
  
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  def new
    
  end

  def create
    
    if params["payjpToken"].blank?
    # paramsの中にjsで作った'payjp-tokenが存在するか確かめる
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
      )
     # ↑ここでpay.jpに保存
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
     # ここでdbに保存
    end
  end

  def show
    
  end

  def destroy
    
  end
end
