class ResetPasswordController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    reset_password = ResetPassword.find_by(token: params[:token])
    unless reset_password && reset_password.auth
      @user = User.new
      render :new, notice: 'お手数ですが再度やり直してください。'
    else
      @user = User.find(reset_password.user_id)
      @token = reset_password.auth_token
    end
  end

  def create
    user = User.find_by(mail: params[:user][:mail])
    if user
      reset_password = ResetPassword.new(user_id: user.id)
      reset_password.save!
    end
    redirect_to reset_password_sent_path
  end

  def update
    reset_password = ResetPassword.find_by auth_token: params[:user][:token]
    @user = User.find reset_password.user_id
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      reset_password.destroy!
      redirect_to login_path
    else
      @token = reset_password.auth_token
      render :edit, notice: 'パスワードを再度ご確認ください。'
    end
  end

  def show
  end
end
