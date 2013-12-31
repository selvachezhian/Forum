class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.integer :forum_thread_id
      t.text :description
      t.integer :parent_id, default: nil
      t.integer :reply_id, default: 0
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
