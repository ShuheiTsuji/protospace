class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  def index
    @products = Product \
                  .order(created_at: :DESC)
                  .includes(:user)
                  .page(params[:page])
                  .per(20)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def destroy
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to root_path , notice: 'succeed in delete'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path, notice: 'succeed in edit'
    else
      render :edit
    end
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to root_path, notice: 'succeed in post'
    else
      render :new
    end
  end

  def show
    @like     = Like.find_by(user_id: current_user.id, product_id: params[:id]) if user_signed_in?
    @comment  = Comment.new
    @comments = @product.comments.includes(:user)
  end

  private
  def product_params
    params.require(:product).permit(
      :title,
      :catch_copy,
      :concept,
      images_attributes: [:id, :image, :role, :_destroy]
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

