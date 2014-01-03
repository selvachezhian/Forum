class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :address
      t.uuid :role_id
      t.string :password
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
