class UsersController < ApplicationController
  before_action :set_user

  def show
    set_page_and_extract_portion_from @user.tweets.reverse_chronologically, per_page: 10
  end

  private
    def set_user
      if params[:username]
        @user = User.find_by!(username: params[:username])
      else
        @user = User.find(params[:id])
      end
    end
end
