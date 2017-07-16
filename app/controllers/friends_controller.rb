class FriendsController < ApplicationController

  def show
  end

  def new
  end

  def create
    new_friend = Friend.create(
      user_id: params[:id],
      follower_id: current_user.id
      )
  end

  def destroy
  end

end
