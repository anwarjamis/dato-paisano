class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :first_last_name, :second_last_name, :birth, :phone, :gender_id, :origen_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
