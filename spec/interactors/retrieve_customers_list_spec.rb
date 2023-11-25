require "rails_helper"

RSpec.describe RetrieveCustomersList do
  let(:interactor) { RetrieveCustomersList }

  context "it successfully retrieve a Customers list from API" do
    let(:result) { interactor.call }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end
end
