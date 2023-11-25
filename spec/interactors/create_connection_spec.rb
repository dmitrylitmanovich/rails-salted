require "rails_helper"

RSpec.describe CreateConnection do
  let(:interactor) { CreateConnection }
  let(:attributes) { Hash[customer_id: 1111111111111111111,
                          username: 'username',
                          password: 'secret'] }

  context "it successfully creates a Connection on API" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end
end
