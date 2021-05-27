class ProductsController < ApplicationController
  def index
    @products = Item.all
  end

  def search
  end
end
