class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  
  before_action do
    @navbar_pages = Page.all
    user_signed_in?
  end

  private 
  
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
end
