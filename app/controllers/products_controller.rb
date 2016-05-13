class ProductsController < ApplicationController
  def new
    @products = Product.new
    @products.images.build
  end

  def create
<<<<<<< HEAD
    @product  = current_user.products.new(create_params)
    if @product.save
      redirect_to root_path, notice: 'succeed in post'
    else
      render :new
    end
=======
    Product.create(create_params)
    redirect_to :root
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml
  end

  private
  def create_params
<<<<<<< HEAD
    params.require(:product).permit(:title, :catch_copy, :concept, images_attributes: [:image, :role])
=======
    params.require(:product).permit(:title, :catch_copy, :concept,
      images_attributes: [:image, :role])
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml
  end
end
