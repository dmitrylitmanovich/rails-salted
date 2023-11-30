require 'rails_helper'

RSpec.describe "AccountsController", type: :request do
  let(:user) { create(:user) }
  describe "GET accounts/" do
    it "returns http success" do
      sign_in user
      get "/connections/1/accounts"
      expect(response).to have_http_status(:success)
    end
  end

end
