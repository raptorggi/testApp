require 'rails_helper'

describe Feedback do
  describe 'presence' do
    it 'name' do
      feedback = Feedback.create(email: '123', phone: '123', message: '3213')
      expect(feedback.errors.any?).to be_truthy
    end

    it 'name' do
      feedback = Feedback.create(email: '123', phone: '123', message: '3213')
      expect(feedback.errors.messages).to include(:name)
    end

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :message }
  end
end
