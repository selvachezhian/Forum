class AddForumIdInThreads < ActiveRecord::Migration
  def change
    add_column :forum_threads, :forum_id, :integer
  end
end
