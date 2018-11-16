class ApplicationController < ActionController::Base

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
end
