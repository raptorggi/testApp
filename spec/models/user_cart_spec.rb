require 'rails_helper'

RSpec.describe UserCart, type: :model do
  describe 'association' do
    it { should belong_to :user }
    it { should belong_to :product }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of :product_id }
    it { is_expected.to validate_presence_of :user_token }
    it { is_expected.to validate_presence_of :quantity }
  end
end
