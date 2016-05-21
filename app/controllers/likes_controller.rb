class LikesController < ApplicationController
  def create
    @like     = Like.create(user_id: current_user.id,  product_id: params[:product_id])
    @likes    = Like.where(product_id: params[:product_id])
    @product  = Product.find(params[:product_id])
    @user     = User.find(params[:user_id])
  end

  def destroy
    @like      = current_user.likes.find_by(product_id: params[:product_id])
    @like.destroy
    @likes    = Like.where(product_id: params[:product_id])
    @product  = Product.find(params[:product_id])
    @user     = User.find(params[:user_id])
  end
end

