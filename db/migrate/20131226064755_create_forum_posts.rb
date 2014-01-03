class CreateForumPosts < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :forum_posts, id: :uuid do |t|
      t.uuid :forum_thread_id
      t.text :description
      t.uuid :parent_id, default: nil
      t.uuid :reply_id, default: nil
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
