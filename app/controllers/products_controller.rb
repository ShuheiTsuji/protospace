class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :DESC).includes(:user)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product  = current_user.products.new(create_params)
    if @product.save
      redirect_to root_path, notice: 'succeed in post'
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:product).permit(
      :title,
      :catch_copy,
      :concept,
      images_attributes: [:image, :role]
    )
  end
end
