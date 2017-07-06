class PinsController < ApplicationController

  def new
  end

  def create
    map_id = params[:map_id]
    pin = Pin.create(
      pin_name: params[:pin_name],
      description: params[:description],
      address: params[:address],
      latitude: latitude(params[:address]),
      longitude: longitude(params[:address]),
      map_id: map_id,
      category_id: params[:category_id]
      )
    redirect_to "/maps/#{map_id}"
  end

  def edit
    @map = Map.find(params[:id])
    render "edit.html.erb"
  end

  def update
    map_id = params[:map_id]
    pin = Pin.update(
      pin_name: params[:pin_name],
      description: params[:description],
      address: params[:address],
      latitude: latitude(params[:address]),
      longitude: longitude(params[:address]),
      map_id: map_id,
      category_id: params[:category_id]
      )
    redirect_to "/maps/#{map_id}"
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

  def latitude(address)
    coordinates = Geocoder.coordinates(address)
    @latitude = coordinates[0]
  end

  def longitude(address)
    coordinates = Geocoder.coordinates(address)
    @longitude = coordinates[1]
  end

end
