class ForumPost < ActiveRecord::Base
  # associations
  belongs_to :forum_thread, counter_cache: true
  belongs_to :user

  # validations
  validates_presence_of :description

  acts_as_tree order: 'created_at'

  def create_reply(values = {})
    ForumPost.create(description: values[:description], forum_thread_id: self.forum_thread_id, parent_id: self.id)
  end

  #call_backs
  after_create { self.forum_thread.forum.increment!(:no_of_posts) }
end
