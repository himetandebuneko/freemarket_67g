class CreditsController < ApplicationController
  
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
          
  def new
    
  end

  def create  
    if params["payjpToken"].blank?
      redirects_to action: 'new'
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to root_path
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
