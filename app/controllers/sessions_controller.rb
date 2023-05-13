class SessionsController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def new
  end

  def create
    if params[:session].present?
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to root_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  

  def destroy
    log_out
    redirect_to root_path
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "Password updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please login"
      redirect_to login_path
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
