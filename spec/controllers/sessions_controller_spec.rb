require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'responds successfully'
  end

  describe '#create' do
    it 'responds successfully'

    it 'redirect to user page if auth success'

    it 'set session with user id'

    it 'render template with auth form if auth failed'

    it 'set flash message if auth failed'
  end

  describe '#destroy' do
    it 'responds successfully'

    it 'nullify user session'

    it 'redirect to index'
  end
end
