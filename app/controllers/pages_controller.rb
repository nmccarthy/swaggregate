class PagesController < ApplicationController

  skip_before_filter :authenticate, :only => :login

  def home
    @subscriptions = Subscription.where(:user_id => current_user.id)
  end

  def login
  end
end
