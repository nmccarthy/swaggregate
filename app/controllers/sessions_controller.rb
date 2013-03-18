class SessionsController < ApplicationController

  skip_before_filter :authenticate, :only => [ :create, :destroy ]

  def create
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to "/", :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", :notice => "Signed out!"
  end
end