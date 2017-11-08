require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'responds successfully'
  end

  describe '#create' do
    it 'responds successfully'

    it 'redirect to user page if user creation success'

    it 'render template "new feedback" if user creation failed'

    it 'create user'
  end

  describe '#index' do
    it 'responds successfully'

    it 'assigns user by session'
  end
end
