class PagesController < ApplicationController

  skip_before_filter :authenticate, :only => :login

  def home
  end

  def login
  end
end
