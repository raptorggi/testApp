require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "presence" do
    it { is_expected.to validate_presence_of :name }
  end
end
