class ConnectionInfoController < ApplicationController
  def index
    connection_id = params[:connection_id]

    @accounts = RetrieveResource.call(resource: 'accounts', required_resource_id: connection_id).data
    @transactions = RetrieveResource.call(resource: 'transactions', required_resource_id: connection_id).data
  end
end
