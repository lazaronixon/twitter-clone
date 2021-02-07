class Users::FollowersController < ApplicationController
  include UserScoped

  def show
    set_page_and_extract_portion_from @user.followers.alphabetically, per_page: 10
  end
end
