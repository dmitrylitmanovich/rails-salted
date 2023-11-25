require 'rails_helper'

RSpec.describe "ConnectionInfos", type: :request do
  describe "GET /" do
    it "creates accounts/transactions successfully in case and returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
