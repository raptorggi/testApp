module Admin
  class ApplicationController < AuthController
    before_action :admin?
    layout 'admin/application'

    def index; end
  end
end
