require "rails_helper"

RSpec.describe CreateCustomer do
  let(:interactor) { CreateCustomer }
  let(:attributes) { Hash[user_email: 'john@example.com'] }

  context "it successfully creates a Customer on API" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end
end
