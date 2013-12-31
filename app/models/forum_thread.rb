class ForumThread < ActiveRecord::Base
  # associations
  has_many :forum_posts

  belongs_to :forum, counter_cache: true
  belongs_to :user

  # validations
  validates_presence_of :name, :description
  validates_length_of :name, maximum: 200
end
