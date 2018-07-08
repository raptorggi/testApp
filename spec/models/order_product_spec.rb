require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  describe 'association' do
    it { should belong_to :order }
    it { should belong_to :product }
  end

  describe 'responds' do
    it { is_expected.to respond_to :order_id, :product_id, :count }
  end

  describe 'presence' do
    it { is_expected.to validate_presence_of :count }
  end

end
