class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_login_user

  def set_login_user
    if session[:id]
      @current_user = User.find(session[:id].to_i)
    end
  end
end
