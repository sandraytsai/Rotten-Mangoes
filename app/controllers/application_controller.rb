class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_sessions_path
    end
  end

  def check_login
    unless @user = User.find_by(id: session[:user_id])
      flash[:notice] = "You must be logged in"
      redirect_to new_sessions_path
    end
  end

  def check_admin
    unless current_user && current_user.admin?
      flash[:notice] = "You must be an admin!"
      redirect_to new_sessions_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def is_impersonating?
    !!session[:admin_id]
  end 

  helper_method :current_user, :is_impersonating?

end
