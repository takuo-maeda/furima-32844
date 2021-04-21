class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)

    if @item.valid? 
    @item.save
      redirect_to root_path
    else  
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @item.update(item_params)
      render 'show'
    else
      render 'edit'
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_payment_id, :prefecture_id, :delivery_prepare_id, :price, :image).merge(user_id: current_user.id)
  end
end
