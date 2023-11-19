class ConnectionsController < ApplicationController
  def index
    customer_id = Customer.find(params[:customer_id]).customer_id
    @connections = RetrieveResource.call(resource: 'connections', required_resource_id: customer_id).data
    Customer.find(params[:customer_id]).create_connection(data: @connections.last) unless Customer.find(params[:customer_id]).connection

    respond_to do |format|
      format.html
      format.json
    end
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
