require 'rails_helper'

describe Page do
  describe 'presence' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :text }
  end
end
