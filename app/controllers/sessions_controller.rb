class SessionsController < ApplicationController
  skip_before_action :authenticate, except: :destroy

  def new
    @user = User.new; render layout: false
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      sign_in user
    else
      redirect_to sign_in_url, flash: { username_hint: params[:user][:username], notice: "Username or password are wrong!" }
    end
  end

  def destroy
    sign_out
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
