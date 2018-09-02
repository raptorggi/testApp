class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  before_action :set_raven_context
  
  before_action do
    @navbar_pages = Page.all
    user_signed_in?
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def set_raven_context
    Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
