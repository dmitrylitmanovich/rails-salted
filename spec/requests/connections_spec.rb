require 'rails_helper'

RSpec.describe "ConnectionsController", type: :request do
  describe "GET connections/" do
    context "it successfully receives a Customer's Connections" do
      it "succeeds" do
        customer = create(:customer)
        get connections_path(customer_id: customer.id)

        expect(response).to have_http_status(200)
      end

      it "returns the Connections for the Customer" do
        connections = [
          create(:connection),
          create(:connection)
        ]
        customer = create(:customer, connections: connections)
        get connections_path(customer_id: customer.id)

        expect(response.body).to eq(connections)
      end
    end
  end

  describe "POST connections/" do
    context "it successfully creates a new Connection" do
      it "succeeds" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET connections/:id" do
    context "it successfully recieves a Connection by ID" do
      it "succeeds" do
        connection = create(:connection)
        get connection_path(id: connection.id)

        expect(response).to have_http_status(200)
      end

      it "returns the Connection by the provided ID" do
        connection = create(:connection),
        get connection_path(id: connection.id)

        expect(response.body).to eq(connection)
      end
    end
  end

  describe "PUT connections/:id" do
    context "it successfully changes a Connection" do
      it "succeeds" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE connections/:id" do
  end
end
