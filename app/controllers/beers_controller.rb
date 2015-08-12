class BeersController < ApplicationController
  def index
  end

  def show
    data = BeerlistService.new.beer_by_name(valid_params[:name])
    if data["data"].nil?
      flash[:notice] = "Beer name invalid. Please try again and Capitalize."
      redirect_to beers_path
    elsif current_user.beers.find_by(name: valid_params[:name]) != nil
      if current_user.beers.find_by(name: valid_params[:name]).name == (data["data"].first["name"])
        flash[:notice] = "Beer is on your list. Please use it's link for editing."
        redirect_to beers_path
      end
    else
      @beer = data["data"].first
    end
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
