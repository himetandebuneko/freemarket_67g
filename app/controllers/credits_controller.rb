class CreditsController < ApplicationController

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
          
  def new
    
  end

  def create  
    if params["payjpToken"].blank?
      redirects_to new_credit_path
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      )

      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to user_path(id: current_user.id)
      else
        render new_credit_path
      end
    end
  end

  def show
    card = Credit.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_credit_path
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)
    end
  end 

  def delete
    card = Credit.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_credit_path
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to user_path(id: current_user.id)
    end
  end

  def pay
    card = Credit.find_by(user_id: current_user.id)
    @product = Product.find(1)
    if card.blank?
      redirect_to new_credits_path, alert: 'ERROR!!'
    else
      Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: 'jpy'
      )
      if @product.update(status: 1, buyer: current_user.id)
        redirect_to action: 'done'
        flash[:notice] = '購入しました。'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to root_path
      end
    end
  end

  def done
  end
  
end
