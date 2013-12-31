class Forum < ActiveRecord::Base
  # associations
  has_many :forum_threads

  belongs_to :user

  # validations
  validates_presence_of :name
  validates_length_of :name, maximum: 200
end
