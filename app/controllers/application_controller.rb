class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_sign_in
    unless current_user
      flash[:danger] = "Please Sign In First"
      session[:intended_destination] = request.fullpath
      redirect_to sign_in_path
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:danger] = "You have to be an admin user in order to perform this action or see this view"
      redirect_to root_path
    end
  end
end
