class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.update(update_params)
    if current_user.save
      redirect_to user_path(current_user), notice: 'succeed in edit'
    else
      redirect_to edit_user_path(current_user), notice: 'fail in edit'
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :member, :profile, :works, :avatar)
  end
end

