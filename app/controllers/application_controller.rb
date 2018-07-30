class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  before_action do
    @navbar_pages = Page.all
    user_signed_in?
  end
end
