class UsersController < ApplicationController
  before_action :set_user, only: %i(edit update)

  def edit; end

  def update
    if @user.update(update_params)
      redirect_to root_path, notice: 'User update was successful.'
    else
      flash[:alert] = 'User update was unsuccessful.'
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def update_params
    params.require(:user).permit(:name, :email)
  end
end
