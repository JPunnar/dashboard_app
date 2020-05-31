# frozen_string_literal: true
require 'rails_helper'
describe Dashboard, type: :model do

  context 'new instance' do
    before do
      @dashboard = Dashboard.new
    end

    it 'should not be valid' do
      expect(@dashboard.valid?).to be false
      expect(@dashboard.errors.full_messages).to match_array(["User must exist",
                                                              "Headline can't be blank"])
    end
  end
end
