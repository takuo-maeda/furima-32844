class CardsController < ApplicationController
  before_action :authenticate_user!
  def new
    redirect_to root_path if user_signed_in? && current_user.card
  end

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first

    if @card.save
      redirect_to root_path
    else
      render "new"
    end
  end

    def show
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end

    def destroy
      card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_token)
      customer.delete
      card.delete
        redirect_to action: "new"
    end
end
