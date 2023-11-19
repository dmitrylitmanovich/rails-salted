class ConnectionInfoController < ApplicationController
  def index
    connection_id = params[:connection_id]

    @accounts = RetrieveResource.call(resource: 'accounts', required_resource_id: connection_id).data
    @transactions = RetrieveResource.call(resource: 'transactions', required_resource_id: connection_id).data
    save_info(@accounts, @transactions)
  end

  private def save_info(accounts, transactions)
    connection = current_user.customer.connection

    accounts.each { |a| connection.accounts.create(data: a) }
    transactions.each { |t| connection.transactions.create(data: t) }
  end
end
