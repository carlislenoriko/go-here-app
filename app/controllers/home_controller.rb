class HomeController < ApplicationController

  # before_action :authenticate_user!

  def home
    if current_user
      @user = User.find(current_user.id)
      render "home.html.erb"
    else
      redirect_to "/login"
    end
  end

end
