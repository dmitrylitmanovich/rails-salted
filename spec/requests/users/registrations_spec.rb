require 'rails_helper'

RSpec.describe "Connections", type: :request do
  describe "POST /" do
    context "it successfully creates a new User and link a Customer to it" do
      it "succeeds" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
