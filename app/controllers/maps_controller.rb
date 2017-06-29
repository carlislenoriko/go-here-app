class MapsController < ApplicationController

  def index
    # if current_user.id
    #   user_id = params[:id]
    @maps = Map.all
    # else
    #   # flash[:warning] = "Please log in to see this page!"
    #   redirect_to "/login"
    render "index.html.erb"
  end

  def new

  end

  def create
    map = Map.create(
      map_name: params[:map_name],
      description: params[:description]
      )
    redirect_to map
  end

  def edit
  end

  def update
  end

  def show
    render "show.html.erb"
  end

  def destroy
  end
  
end
