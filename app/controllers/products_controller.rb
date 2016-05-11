class ProductsController < ApplicationController
  def new
    @products = Product.new
    @products.images.build
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      redirect_to :root
    else
      render  :new
    end
  end

  private
  def create_params
    params.require(:product).permit(:title, :catch_copy, :concept,
      images_attributes: [:image, :role])
  end
end

