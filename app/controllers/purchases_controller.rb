class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_redirect_to_root

  def index
    @address_purchase = AddressPurchase.new
    item_find
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
