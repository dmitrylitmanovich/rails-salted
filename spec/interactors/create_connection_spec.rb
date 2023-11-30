require "rails_helper"

RSpec.describe CreateConnection do
  subject(:context) { CreateConnection.call(
    customer_id: 1111111111111111111,
    username: 'username',
    password: 'secret'
  ) }

  context "it successfully creates a Connection on API" do
    it "succeeds" do
      expect(context).to be_a_success
    end
  end
end
