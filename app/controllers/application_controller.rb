class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def authorize
    redirect_to root_url, alert: "Not authorized" if current_user.nil?
  end

end
