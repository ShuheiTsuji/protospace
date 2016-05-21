class LikesController < ApplicationController
  before_action :set_user, :set_product, :set_likes
  def create
    @like     = Like.create(user_id: current_user.id,  product_id: params[:product_id])
  end

  def destroy
    @like     = current_user.likes.find_by(product_id: params[:product_id])
    @like.destroy
  end

  def set_user
    @user     = User.find(params[:user_id])
  end

  def set_product
    @product  = Product.find(params[:product_id])
  end

  def set_likes
    @likes    = Like.where(product_id: params[:product_id])
  end
end

