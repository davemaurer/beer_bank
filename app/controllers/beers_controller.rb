class BeersController < ApplicationController
  def index
  end

  def show
    data = BeerlistService.new.beer_by_name(valid_params[:name])
    if data["data"].nil?
      flash[:notice] = "Beer name invalid. Please try again and Capitalize."
      redirect_to beers_path
    elsif current_user.beers.find_by(name: valid_params[:name]).name != nil && current_user.beers.find_by(name: valid_params[:name]).name == (data["data"].first["name"])
      list_beer = current_user.beers.find_by(name: valid_params[:name])
      redirect_to beer_path(list_beer.id)
    else
      @beer = data["data"].first
    end
  end

  def new
  end

  def create
    new_beer = current_user.beers.find_or_create_by(valid_params)
    flash[:notice] = "You have #{new_beer.name} a beer to your list!"
    redirect_to beers_path
  end

  def edit
    @beer = current_user.beers.find(params[:id])
  end

  def update
    @beer = current_user.beers.find(params[:id])
    if @beer.update(valid_params)
      flash[:notice] = "Beer Update Successful"
      redirect_to beers_path
    else
      render :edit
    end
  end

  private

  def valid_params
    params.require(:beer).permit(:name, :ibu, :abv, :description, :rating)
  end
end
