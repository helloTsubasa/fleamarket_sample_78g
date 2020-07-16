class CardsController < ApplicationController
  require "payjp"

  def new
    @card = Card.find_by(user_id: current_user.id)
    if @card.present?
      redirect_to cards_path
    else
      @card = Card.new
    end
  end

  def index
    @card = Card.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]

    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      if @card.save
        redirect_to cards_path
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to new_card_path
  end

end
