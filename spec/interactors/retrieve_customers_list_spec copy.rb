require "rails_helper"

RSpec.describe RetrieveResource do
  let(:interactor) { RetrieveResource }
  let(:acc_attributes) { Hash[resource: 'accounts',
                          required_resource_id: 1111111111] }
  let(:conn_attributes) { Hash[resource: 'connections',
                          required_resource_id: 1111111111] }
  let(:tr_attributes) { Hash[resource: 'transactions',
                          required_resource_id: 1111111111] }
  let(:cus_attributes) { Hash[resource: 'customers',
                          required_resource_id: 1111111111] }

  context "it successfully an Account from API" do
    let(:result) { interactor.call(acc_attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end

  context "it successfully a Connection from API" do
    let(:result) { interactor.call(conn_attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end

  context "it successfully a Transaction from API" do
    let(:result) { interactor.call(tr_attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end

  context "it successfully a Customer from API" do
    let(:result) { interactor.call(cus_attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end
  end
end
