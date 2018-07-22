require 'rails_helper'

describe User do
  describe 'association' do
    it { should have_many :user_carts }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }

    it { should validate_length_of(:password).is_at_least(6) }
  end
end
