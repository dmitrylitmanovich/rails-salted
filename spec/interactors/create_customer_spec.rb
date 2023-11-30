require "rails_helper"

RSpec.describe CreateCustomer do
  subject(:context) { CreateCustomer.call(
    user_email: 'john@example.com'
  ) }

  context "it successfully creates a Customer on API" do
    it "succeeds" do
      expect(context).to be_a_success
    end
  end
end
