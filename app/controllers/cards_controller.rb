class CardsController < ApplicationController

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

    def show
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end

    def destroy
      card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_token)
      customer.delete
      card.delete
        # redirect_to action: "new"
    end

  end
end
