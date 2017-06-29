class PinsController < ApplicationController

  def new
  end

  def create
    pin = Pin.create(
      pin_name: params[:pin_name],
      description: params[:description],
      address: params[:address],
      map_id: params[:map_id],
      category_id: params[:category_id]
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
    map = Map.find(params[:id])
    map.destroy
    redirect_to map
  end

end
