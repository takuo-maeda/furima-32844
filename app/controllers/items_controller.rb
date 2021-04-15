class ItemsController < ApplicationController

  def index
    # @items=Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  # def destroy
    
  # end

  private
  def  item_params
    params.reqire(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_payment_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
