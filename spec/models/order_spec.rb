require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should have_many :order_products }
    it { should have_many :products }
    it { should have_many(:products).through :order_products }
    it { should accept_nested_attributes_for :order_products }
  end

  describe 'presence' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :surname }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :email }
  end

  describe 'length' do
    it { is_expected.to validate_length_of(:name).is_at_most(60) }
    it { is_expected.to validate_length_of(:surname).is_at_most(60) }
    it { is_expected.to validate_length_of(:phone).is_at_least(10) }
    it { is_expected.to validate_length_of(:phone).is_at_most(15) }
  end
end
