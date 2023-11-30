require 'rails_helper'

RSpec.describe 'ConnectionsController', type: :request do
  let(:user) { create(:user) }

  describe 'GET connections/' do
    context "it successfully returns a Customer's Connections" do
      it 'succeeds' do
        sign_in user

        customer = create(:customer, user: user)
        get customer_connections_path(customer)
        expect(response).to have_http_status(200)
      end

      it 'returns the Connections for the Customer' do
        sign_in user

        customer = create(:customer, user: user)
        connections = [
          create(:connection, customer_id: customer.id),
          create(:connection, customer_id: customer.id)
        ]
        get customer_connections_path(customer, format: :json)
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
        sign_in user

        customer = create(:customer, user: user)
        post customer_connections_path(customer)
        expect(response).to have_http_status(200)
      end

      it 'creates a new Conection on API and local DB' do
        sign_in user

        customer = create(:customer, user: user)
        let(:result) { interactor.call(
          customer_id: customer.id,
          username: creds[:username],
          password: creds[:password]
        ) }
        expect(result.successful?).to be(true)
        post customer_connections_path(customer)
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
        sign_in user

        connection = create(:connection, customer: create(:customer, user: user))
        get connection_path(id: connection.id)

        expect(response).to have_http_status(200)
      end

      it 'returns the Connection by the provided ID' do
        sign_in user

        connection = create(:connection, customer: create(:customer, user: user))
        get connection_path(id: connection.id)

        expect(response.body).to eq(connection)
      end
    end
  end

  describe 'PUT connections/:id' do
    context 'it successfully changes a Connection' do
      it 'succeeds' do
        sign_in user

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE connections/:id' do
  end
end
