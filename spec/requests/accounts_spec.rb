require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/accounts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
