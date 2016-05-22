class CommentsController < ApplicationController
  def create
    current_user.comments.create(comment_params)
    @product  = Product.find(params[:product_id])
    @user     = User.find(params[:user_id])
    @comments = @product.comments.includes(:user)
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(product_id: params[:product_id])
  end
end

