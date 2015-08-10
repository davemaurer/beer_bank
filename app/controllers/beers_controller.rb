class BeersController < ApplicationController
  def index
    # @beers = Beer.all.where(current_user.id == List.user_id)
  end

  def show
    data = BeerlistService.new.beer_by_name(valid_params[:name])
    @beer = data["data"].first
  end

  def new
  end

  def create
    current_user.beers.find_or_create_by(valid_params)
  end

  private

  def valid_params
    params.require(:beer).permit(:name, :ibu, :abv, :description)
  end
end
