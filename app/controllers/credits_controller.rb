class CreditsController < ApplicationController
  
  require 'payjp'

  def new
    
  end

  def create
    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: 1100, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
  end

  def show
    
  end

  def destroy
    
  end
end
