class BeersController < ApplicationController
  def index
  end

  def show
    data = BeerlistService.new.beer_by_name("Stone IPA")
    @beer = data["data"].first
  end

  def new
  end

  def create
    @beer = Beer.create(
            name: @beer.name,
            ibu: @beer.ibu,
            abv: @beer.abv,
            description: @beer.description
            )
  end
end
