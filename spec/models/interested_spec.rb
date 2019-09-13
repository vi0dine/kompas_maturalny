# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interested, type: :model do
  let(:interested) { create(:interested) }

  context 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:field_detail) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:field_detail_id) }
  end
end
