class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    # default roles
    Role.create!(name: 'Admin')
    Role.create!(name: 'User')
  end
end
