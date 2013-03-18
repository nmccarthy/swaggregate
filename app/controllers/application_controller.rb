class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  helper_method :current_user

  private

  def authenticate
    # user = current_user
    # logger.debug "getting the user a different way maybe: " + user.id.to_s
    if current_user
      logger.debug "============== NOT REDIRECTED =============="
    else
      logger.debug "============== REDIRECTED =============="
      redirect_to "/login"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
