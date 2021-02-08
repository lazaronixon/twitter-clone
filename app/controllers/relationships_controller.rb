class RelationshipsController < ApplicationController
  before_action :set_user, only: :create

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(user: Current.user, target: @user)
    if @relationship.save
      redirect_to @user, notice: "User was successfully followed"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_user
      if @user = User.find_by(username: params[:username])
        # Nice, I found this user!
      else
        redirect_to new_relationship_path, notice: "User not found!"
      end
    end
end
