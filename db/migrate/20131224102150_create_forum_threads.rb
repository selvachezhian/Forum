class CreateForumThreads < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :forum_threads, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :forum_posts_count, default: 0
      t.uuid :forum_id
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
