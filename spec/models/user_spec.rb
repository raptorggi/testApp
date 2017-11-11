require 'rails_helper'

describe User do 
  describe "presence" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe "length" do
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
