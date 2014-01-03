require 'spec_helper'

describe 'UserController', js: true do

  it 'should open login page' do
    visit('/')
    expect(page).to have_content 'Email'
  end

  it 'should log me in' do
    Role.create!(name: 'Admin')
    Role.create!(name: 'User')
    User.create!(first_name: 'Trial', last_name: 'User', email: 'trial.user@forum.com', password: Digest::MD5.hexdigest('trial.user'), role_id: Role.find_by_name('Admin').id)
    puts User.count
    puts ActiveRecord::Base.connection.current_database
    visit('/')
    within('.login_form') do
      fill_in 'login', with: 'admin.user@forum.com'
      fill_in 'password', with: 'admin.user'
    end
    click_button('submit-login')
    #sleep(2)
    expect(page).to have_content 'Forum'
  end

end
