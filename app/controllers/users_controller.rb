class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(update_params)
    redirect_to user_path(current_user), notice: 'ログインに成功しました'
  end

  private
  def update_params
    params.require(:user).permit(:name, :member, :profile, :works, :avatar)
  end
end

