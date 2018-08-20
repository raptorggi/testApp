require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'association' do
    it { should belong_to :category }
    it { should have_many :orders }
    it { should have_many :order_products }
    it { should have_many :user_carts }
    it { have_many(:orders).through :order_products }
  end

  describe 'presence' do
    it { is_expected.to validate_presence_of :name_ru }
    it { is_expected.to validate_presence_of :name_en }
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :reserved }
  end
end
