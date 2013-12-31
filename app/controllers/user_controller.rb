class UserController < ApplicationController

  layout 'login'

  def index
    @form_controller, @form_action = 'user', 'login'
  end

  def login
    user = User.where(email: params[:login], password: Digest::MD5.hexdigest(params[:password]))
    if user.present?
      redirect_to controller: 'forum', action: 'index'
    else
      flash[:error] = 'Username or Password does not match, please check again'
      redirect_to root_url
    end
  end

end
