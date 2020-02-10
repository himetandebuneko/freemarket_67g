class CreditsController < ApplicationController
  
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  
  def new
    # redirect_to action: 'show' if current_user.card.present?
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
      if @card.save
        redirect_to action: 'show'
      else
        redirect_to action: 'create'
      end
    end
  end

  def show
    
  end

  def destroy
    
  end
end
