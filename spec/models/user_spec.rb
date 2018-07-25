require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many :user_carts }
    it { should have_many :orders }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :second_name }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :email }

    it { is_expected.to validate_length_of(:name).is_at_most(60) }
    it { is_expected.to validate_length_of(:second_name).is_at_most(60) }
    it { is_expected.to validate_length_of(:phone).is_at_least(10) }
    it { is_expected.to validate_length_of(:phone).is_at_most(15) }
  end
end
