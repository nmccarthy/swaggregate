class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  helper_method :current_user

  private

  def authenticate
    if !current_user
      redirect_to "/login"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
