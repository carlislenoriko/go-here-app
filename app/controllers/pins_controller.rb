class PinsController < ApplicationController

  def new
    @categories = Category.all
    @map = Map.find(params[:map_id])
  end

  def create
    @map = Map.find(params[:map_id])
    @categories = Category.all
    pin = Pin.create(
      pin_name: params[:pin_name],
      description: params[:description],
      address: params[:address],
      latitude: latitude(params[:address]),
      longitude: longitude(params[:address]),
      map_id: params[:map_id],
      category_id: params[:category_id]
      )
    redirect_to "/maps/#{params[:map_id]}"
  end

  def edit
    @categories = Category.all
    # @map = Map.find(params[:id])
    @pin = Pin.find(params[:id])
    render "edit.html.erb"
  end

  def update
    @pin = Pin.find(params[:id])
    map_id = params[:map_id]
    @pin.update(
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
    @pin = Pin.find(params[:id])
    render "show.html.erb"
  end

  def destroy
    pin = Pin.find(params[:id])
    map_id = pin.map_id
    pin.destroy
    redirect_to "/maps/#{map_id}"
  end

  def search_results
    search_text = params[:search]
    @pins = Pin.where("pin_name LIKE ? OR address LIKE ?", "%#{search_text}%", "%#{search_text}%")
    render "search_results.html.erb"
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
