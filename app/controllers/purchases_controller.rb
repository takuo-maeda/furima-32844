class PurchasesController < ApplicationController
  
  def index
    @address_purchase = AddressPurchase.new
  end

  def create
    @address_purchase = AddressPurchase.new(address_params)
    if @address_purchase.valid?
      @address_purchase.save
      # binding.pryry
      redirect_to root_path
    else
      render ("purchases/index")
    end
  end

  private

  def address_params
    params.require(:address_purchase).permit(:postal_code, :prefecture_id, :town, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_id:params[:id])
  end

end
