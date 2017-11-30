class SubscribeController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to created_path
    else
      render :new
    end
  end

  def created
  end

  def confirm
    @user = User.find_by(activation_token: params[:activation_token])
    if @user && @user.activate!
      session[:id] = @user.id
      redirect_to questions_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:mail, :password, :password_confirmation, :activation_token, :activation_status, :name)
    end
end
