class ConnectionInfoController < ApplicationController
  def index
    connection_id = params[:connection_id]

    @accounts = RetrieveAccounts.call(connection_id: connection_id).data
    @transactions = RetrieveTransactions.call(connection_id: connection_id).data
  end
end
