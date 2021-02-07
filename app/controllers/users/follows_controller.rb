class Users::FollowsController < ApplicationController
  include UserScoped

  def create
    @user.follow; redirect_to @user, notice: "You are now following #{@user.name}"
  end
end
