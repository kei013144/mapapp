class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)&.authenticate(params[:session][:password])
    if user
      log_in user
      redirect_to map_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
