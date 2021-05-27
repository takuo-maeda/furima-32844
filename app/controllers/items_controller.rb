class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect_to_root, only: [:edit, :update, :destroy]
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

  end

  def edit
  end

  def update
    if @item.update(item_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    goods = Item.where(['item_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: goods}
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_payment_id, :prefecture_id, :delivery_prepare_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  def set_redirect_to_root
    if current_user.id != @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
