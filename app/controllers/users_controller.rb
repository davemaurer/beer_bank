class UsersController < ApplicationController
  def index
    @beers = Beer.find_by(current_user)
  end
end
