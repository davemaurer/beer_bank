class Beer < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, :uniqueness => {:scope => :user_id}
end
