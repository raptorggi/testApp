class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  
  before_action do
    @navbar_pages = Page.all
    user_signed_in?
  end


  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
