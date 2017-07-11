class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render "index.json.jbuilder"
  end

  def show
    @category = Category.find(params[:id])
    render 'show.json.jbuilder'
  end

end
