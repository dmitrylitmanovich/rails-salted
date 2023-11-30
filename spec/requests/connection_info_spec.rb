require 'rails_helper'

RSpec.describe "ConnectionInfosController", type: :request do
  let(:user) { create(:user) }
  describe "GET /connection_info/1" do
    it "creates accounts/transactions successfully in case and returns http success" do
      sign_in user
      build(:customer, { user: user, customer_id: 11111111, identifier: user.email })
      get "/connection_info/1"
      expect(response).to have_http_status(:success)
    end
  end

end
