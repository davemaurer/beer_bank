class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :find_beer

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def find_beer
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
end
