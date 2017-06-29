class MapsController < ApplicationController

  def index
    if current_user
      user = User.find(current_user.id)
      @maps = user.maps
      puts @maps
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
      description: params[:description],
      user_id: current_user.id
      )
    redirect_to map
  end

  def edit
    @map = Map.find(params[:id])
    render "edit.html.erb"
  end

  def update
    map = Map.find(params[:id])
    map.update(
      map_name: params[:map_name],
      description: params[:description]
      )
    # flash[:info] = "Contact Info Updated"
    redirect_to "/maps/#{map.id}"
  end

  def show
    @map = Map.find(params[:id])
    render "show.html.erb"
  end

  def destroy
  end
  
end
