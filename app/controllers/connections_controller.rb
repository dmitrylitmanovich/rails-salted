class ConnectionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    @connections = customer.connection
    # customer.create_connection(data: @connections.last) unless customer.connection

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def create
    customer_id = Customer.find(params['customer_id']).customer_id

    connection = CreateConnection.call(
      username: credentials.username,
      password: credentials.password,
      customer_id: customer_id
    )

    connection.data
  end

  def edit
    do_action = params[:do_action]
    connection_id = params[:id]
    updated_connection = DoActionOnConnection.call(
      do_action: do_action,
      connection_id: connection_id,
      username: credentials.username,
      password: credentials.password
    )
    flash[:notice] = updated_connection.success? && 'Success!'

    redirect_to customer_connections_path(current_user.customer)
  end

  def destroy
  end

  private 

  def credentials
    if %w[development test].include? Rails.env  # TODO: Change to a user prompt
      OpenStruct.new(
        username: 'username'
        password: 'secret'
      )
    end
  end
end
