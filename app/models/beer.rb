class Beer < ActiveRecord::Base
  has_and_belongs_to_many :users

  # helper_method :beer_count
  #
  # def beer_count
  #   Beer.all.count
  # end
end
