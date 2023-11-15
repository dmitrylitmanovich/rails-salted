class ConnectionsController < ApplicationController
  def index
    # @connection = Connection.find(paramss[:customer_id])
  end

  def show
    # @connection = Connection.find(paramss[:customer_id])
  end

  def create
    if %w[development test].include? Rails.env  # TODO: Change to a user prompt
      username = 'username'
      password = 'secret'
    end
    customer_id = Customer.find(params['customer_id']).customer_id

    connection = CreateConnection.call(
      username: username,
      password: password,
      customer_id: customer_id
    )
    connection.data
  end
end
