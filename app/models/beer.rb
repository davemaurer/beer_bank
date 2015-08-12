class Beer < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings
  has_and_belongs_to_many :users

  # validates :name, :uniqueness => {:scope => :user_id}
end
