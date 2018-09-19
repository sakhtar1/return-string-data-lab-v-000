class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def inventory
   product = Product.find(params[:id])
   render plain: product.inventory > 0 ? true : false
 end

 def description
   product = Product.find(params[:id])
   render plain: product.description
 end

 def show
  set_post
end

def new
  @post = Post.new
end

def create
  @post = Post.create(post_params)
  @post.save
  redirect_to post_path(@post)
end

def edit
end

def update
  @post.update(post_params)
  redirect_to post_path(@post)
end



private
# Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description)
  end
end
