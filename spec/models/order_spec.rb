require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should belong_to :user }
    it { should have_many :order_products }
    it { should have_many :products }
    it { should have_many(:products).through :order_products }
    it { should accept_nested_attributes_for :order_products }
  end

  describe 'responds' do
    it { is_expected.to respond_to :address }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of :address }
  end
end
