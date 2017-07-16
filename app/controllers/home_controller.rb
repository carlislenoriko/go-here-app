class HomeController < ApplicationController

  # before_action :authenticate_user!

  def home
    if current_user
      @user = User.find(current_user.id)
      @friends = []
      @user.friends.each do |friend|
        u = User.find(friend.follower_id)
        # puts u.first_name
        # puts u.id
       @friends << User.find(friend.follower_id)
      end
      render "home.html.erb"
    else
      redirect_to "/login"
    end
  end

end
