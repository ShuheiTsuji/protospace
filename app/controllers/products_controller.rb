class ProductsController < ApplicationController
  def new
    @products = Product.new
    @products.images.build
  end

  def create
    Product.create(create_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:product).permit(:title, :catch_copy, :concept,
      images_attributes: [:images]
    )
  end

end

