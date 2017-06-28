class MapsController < ApplicationController

  def index
    if current_user.id
      @maps = Map.find(user_id: params[:user_id])
      render "index.html.erb"
    else
      # flash[:warning] = "Please log in to see this page!"
      redirect_to "/login"
    end
  end

  def new

  end

  def create
    map = Map.create(
      map_name: params[:map_name],
      description: params[:description]
      )
    redirect_to "/maps/index/"
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
end
