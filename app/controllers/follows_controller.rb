class FollowsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(username: params[:username])
      follow_user
    else
      redirect_to new_follow_path, notice: "User not found"
    end
  end

  private
    def follow_user
      if @user.followed?
        redirect_to new_follow_path, notice: "You are already following this user"
      else
        @user.follow; redirect_to @user, notice: "User was successfully followed"
      end
    end
end
