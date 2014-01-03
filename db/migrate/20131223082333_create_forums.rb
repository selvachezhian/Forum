class CreateForums < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :forums, id: :uuid do |t|
      t.string :name
      t.integer :no_of_posts, default: 0
      t.integer :forum_threads_count, default: 0
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
