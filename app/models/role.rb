class Role < ActiveRecord::Base

  #relationships
  has_many :users
end
