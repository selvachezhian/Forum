class CreateRoles < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :roles, id: :uuid do |t|
      t.string :name
      t.timestamps
    end

    # default roles
    Role.create!(name: 'Admin')
    Role.create!(name: 'User')

    # default users
    User.create!(first_name: 'Admin', last_name: 'User', email: 'admin.user@forum.com', password: Digest::MD5.hexdigest('admin.user'), role_id: Role.find_by_name('Admin').id)
    User.create!(first_name: 'Normal', last_name: 'User', email: 'normal.user@forum.com', password: Digest::MD5.hexdigest('normal.user'), role_id: Role.find_by_name('User').id)
  end
end
