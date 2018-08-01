class ApplicationController < ActionController::Base
  helper_method :current_user
  def set_current_user(user)
    @@current_user = user if session[:status] == true
  end
end
