class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action do
    @pages = Page.all
    logged_in?
  end

  protected

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authentificate
    head 403 unless logged_in?
  end

  def admin?
    redirect_to :index unless @current_user.admin
  end

  attr_reader :current_user

  helper_method :current_user
  helper_method :admin?
  helper_method :logged_in?
end
