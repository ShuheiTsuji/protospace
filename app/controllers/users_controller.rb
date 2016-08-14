class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @products = @user \
                   .products
                   .includes(:tags)
                   .page(params[:page])
                   .per(20)
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path, notice: 'succeed in edit'
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

  def set_user
    @user = User.find(params[:id])
  end
end

