class ProductsController < ApplicationController
  before_action :serach_product, only: [:index, :search]
  def index
    @products = Item.all
    set_product_column
  end

  def search
    @results = @p.result
  end

  private
  
  def serach_product
    @p =  Item.ransack(params[:q])
  end
  
  def set_product_column
    @product_name = Item.select("item_name").distinct  # 重複なくnameカラムのデータを取り出す
    @product_category = Item.select("category_id").distinct  # 重複なくnameカラムのデータを取り出す
    @product_status = Item.select("status_id").distinct  # 重複なくnameカラムのデータを取り出す
    @product_category_name = Category.all  # 重複なくnameカラムのデータを取り出す
    @product_status_name = Status.all  # 重複なくnameカラムのデータを取り出す
  end
end
