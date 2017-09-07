class SubscribeController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new
  end

  def created
  end

  def confirm
  end

  def complete
  end

  private
    def user_params
      params.require(:user).permit(:mail, :password, :password_confirmation, :activation_token, :activation_status, :name, :score)
    end
end
