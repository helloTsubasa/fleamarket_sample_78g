class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "index" if card.exists?
  end

  def index
  end

  def create
  end



end
