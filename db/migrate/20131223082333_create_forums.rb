class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.integer :no_of_threads
      t.integer :no_of_posts
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
