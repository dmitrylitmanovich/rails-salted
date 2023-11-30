require "rails_helper"

RSpec.describe RetrieveResource do
  subject(:acc_context) { CreateCustomer.call(
    resource: 'accounts',
    required_resource_id: 1111111111
  ) }
  subject(:conn_context) { CreateCustomer.call(
    resource: 'connections',
    required_resource_id: 1111111111
  ) }
  subject(:tra_context) { CreateCustomer.call(
    resource: 'transactions',
    required_resource_id: 1111111111
  ) }
  subject(:cus_context) { CreateCustomer.call(
    resource: 'customers',
    required_resource_id: 1111111111
  ) }

  context "it successfully retrieve an Account from API" do
    it "succeeds" do
      expect(acc_context).to be_a_success
    end
  end

  context "it successfully retrieve a Connection from API" do
    it "succeeds" do
      expect(conn_context).to be_a_success
    end
  end

  context "it successfully retrieve a Transaction from API" do
    it "succeeds" do
      expect(tra_context).to be_a_success
    end
  end

  context "it successfully retrieve a Customer from API" do
    it "succeeds" do
      expect(cus_context).to be_a_success
    end
  end
end
