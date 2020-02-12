class CreditsController < ApplicationController
  before_action :authenticate_user!
  
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
    card = Credit.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to :new_credit_path 
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)
    end
  end 

  def destroy
    card = Credit.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    
  end
end
