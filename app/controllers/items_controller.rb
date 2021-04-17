class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    # @items=Item.all
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
  # end
    if @item.valid? 
    @item.save
      # return
      redirect_to root_path
    else  
      render 'new'
    end
  end

  # def destroy
    
  # end

  
  
  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_payment_id, :prefecture_id, :delivery_prepare_id, :price, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
