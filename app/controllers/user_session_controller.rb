class UserSessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(mail: params[:user][:mail])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to session[:referer] ? session[:referer] : questions_path
    else
      @user = User.new
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
