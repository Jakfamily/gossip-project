class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def new
    if logged_in?
      @gossip = Gossip.new
      @user_id = current_user.id
    else
      redirect_to login_path, alert: "Vous devez être connecté pour créer un potin."
    end
  end
end

