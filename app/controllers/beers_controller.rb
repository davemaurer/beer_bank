class BeersController < ApplicationController
  def index
  end

  def show
    find_beer
  end

  def new
  end

  def create
    current_user.beers.find_or_create_by(valid_params)
    flash[:notice] = "You have added a beer to your list!"
    redirect_to beers_path
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
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
