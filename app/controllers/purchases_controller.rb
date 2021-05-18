class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_redirect_to_root

  def index
    @address_purchase = AddressPurchase.new
    item_find
    card_user_find
  end
  
  def create
    @address_purchase = AddressPurchase.new(address_params)
    item_find
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render ("purchases/index")
    end
  end
  
  private
  
  def item_find
    @item = Item.find(params[:item_id])
  end

  def card_user_find
    @card_info = Card.pluck(:user_id)
    # @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    # redirect_to new_card_path and return unless card.present?
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def address_params
    params.require(:address_purchase).permit(:postal_code, :prefecture_id, :town, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item #決済処理の記述
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create( amount: @item.price , card: address_params[:token], currency: 'jpy')
  end

  def set_redirect_to_root
    if current_user.id == Item.find(params[:item_id]).user_id || Purchase.exists?(item_id: params[:item_id])
      redirect_to root_path
    end
  end
end
