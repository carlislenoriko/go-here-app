class MapsController < ApplicationController

  def index
  end

  def new

  end

  def create
    map = Map.create(
      map_name: params[:map_name],
      description: params[:description]
      )
    redirect_to "/maps/index"
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
