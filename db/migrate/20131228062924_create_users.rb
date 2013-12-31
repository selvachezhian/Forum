class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :address
      t.integer :role_id
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
