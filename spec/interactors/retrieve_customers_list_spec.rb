require "rails_helper"

RSpec.describe RetrieveCustomersList do
  subject(:context) { RetrieveCustomersList.call }

  context "it successfully retrieve a Customers list from API" do
    it "succeeds" do
      expect(context).to be_a_success
    end
  end
end
