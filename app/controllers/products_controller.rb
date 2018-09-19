class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def inventory
   product = Product.find(params[:id])
   render plain: product.inventory > 0 ? true : false
 end

end
