class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new;
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
