class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action do
    @pages = Page.all
  end

  private 
  def logged_in?
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authentificate
    head 403 unless logged_in?
  end

  helper_method :logged_in?
end