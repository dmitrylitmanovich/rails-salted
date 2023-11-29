require 'rails_helper'

RSpec.describe 'ConnectionsController', type: :request do
  describe 'GET connections/' do
    context "it successfully returns a Customer's Connections" do
      it 'succeeds' do
        customer = create(:customer)
        get connections_path(customer_id: customer.id)
        expect(response).to have_http_status(200)
      end

      it 'returns the Connections for the Customer' do
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

  describe 'POST connections/' do
    let(:interactor) { CreateConnection }
    let(:creds) { Hash[ username: 'username',
                              password: 'secret' ] }
    context 'it successfully creates a new Connection' do
      it 'succeeds' do
        customer = create(:customer)
        post connections_path(customer_id: customer.id)
        expect(response).to have_http_status(200)
      end

      it 'creates a new Conection on API and local DB' do
        customer = create(:customer)
        let(:result) { interactor.call(
          customer_id: customer.id,
          username: creds[:username],
          password: creds[:password]
        ) }
        expect(result.successful?).to be(true)
        post connections_path(customer_id: customer.id)
        expect(response.body).to eq(result.data)
        connection = create(:connection, result.data)
        customer.connections.create(connection)
        expect(customer.connections.last.customer_id).to eq(customer.id)
      end
    end
  end

  describe 'GET connections/:id' do
    context 'it successfully recieves a Connection by ID' do
      it 'succeeds' do
        connection = create(:connection)
        get connection_path(id: connection.id)

        expect(response).to have_http_status(200)
      end

      it 'returns the Connection by the provided ID' do
        connection = create(:connection)
        get connection_path(id: connection.id)

        expect(response.body).to eq(connection)
      end
    end
  end

  describe 'PUT connections/:id' do
    context 'it successfully changes a Connection' do
      it 'succeeds' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE connections/:id' do
  end
end
