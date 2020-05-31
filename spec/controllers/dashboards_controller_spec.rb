# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  let(:user) { User.create(email: 'mail@mail.ee', password: 'BlaBla') }
  before { sign_in(user) }

  describe "PATCH #update" do
    context "should be able to update dashboard" do
      let(:dashboard) { Dashboard.create(user: user, headline: 'headline') }

      it "updates" do
        patch :update, params: { id: dashboard.id, dashboard: { headline: 'new headline'}}
        expect(dashboard.reload.headline).to eq('new headline')
      end
    end

    context "should not be able to update other users dashboard" do
      let(:user2) { User.create(email: 'mail2@mail.ee', password: 'BlaBla') }
      let(:other_dashboard) { Dashboard.create(user: user2, headline: 'other users dashboard') }

      it "does not update, raises error" do
        expect {
          patch :update, params: { id: other_dashboard.id, dashboard: { headline: 'new headline'}}
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
