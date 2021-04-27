class PurchasesController < ApplicationController
  
  def index
    @address_purchase = AddressPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @address_purchase = AddressPurchase.new(address_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render ("purchases/index")
    end
  end
  
  private
  
  def address_params
    params.require(:address_purchase).permit(:postal_code, :prefecture_id, :town, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_id:params[:id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: address_params[:price],
      card: address_params[:token],
      currency: 'jpy'
      )
  end
  
end
