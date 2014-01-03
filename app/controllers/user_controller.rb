class UserController < ApplicationController

  layout 'login'

  def index
    @form_controller, @form_action = 'user', 'login'
  end

  def login
    user = User.where(email: params[:login], password: Digest::MD5.hexdigest(params[:password])).first
    puts User.count
    puts ActiveRecord::Base.connection.current_database
    if user
      redirect_to controller: 'forum', action: 'index'
    else
      flash[:error] = 'Username or Password does not match, please check again'
      redirect_to root_url
    end
  end

end
