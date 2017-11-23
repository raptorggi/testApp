require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      user = User.create(name: "qwerty", email: "1234", password: "111111", admin: true)
      session[:user_id] = user.id
      get :index
      expect(response).to be_success
    end
  end
end
