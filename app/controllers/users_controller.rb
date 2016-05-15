class UsersController < ApplicationController
  def show
    @user     = User.find(params[:id])
    @product  = Product.order(created_at: :DESC).includes(:user).page(params[:page]).per(3)
  end

  def update
    if current_user.update(update_params)
      redirect_to user_path(current_user), notice: 'succeed in edit'
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(
      :name,
      :member,
      :profile,
      :works,
      :avatar
      )
  end
end

