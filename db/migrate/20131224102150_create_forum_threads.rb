class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.string :name
      t.text :description
      t.integer :posts_count, default: 0
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
