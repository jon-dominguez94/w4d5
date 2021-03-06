class ApplicationController < ActionController::Base

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end

  def require_login
    # if !logged_in?
    #
    # end
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  # private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
