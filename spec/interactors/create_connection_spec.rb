require "rails_helper"

RSpec.describe CreateConnection do
  let(:interactor) { CreateConnection }
  let(:attributes) { Hash[customer_id: 1140589158708812068,
                          username: 'john@example.com',
                          password: 'secret'] }

  context "it successfully creates a Connection on API" do
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    # it "creates a Connection with correct title and author" do
    #   expect(result.book.title).to eq("The Fire Next Time")
    #   expect(result.book.author).to eq("James Baldwin")
    # end
  end
end
