class Admin::ApplicationController < AuthController
  before_action :admin?
  layout 'admin/application'
  def index
  end

end
