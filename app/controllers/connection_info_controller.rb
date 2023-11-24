class ConnectionInfoController < ApplicationController
  # def index
  #   connection_id = params[:connection_id]

    if current_user.customer.connection&.accounts&.empty?
      @accounts = RetrieveResource.call(resource: 'accounts', required_resource_id: connection_id).data
      @transactions = RetrieveResource.call(resource: 'transactions', required_resource_id: connection_id).data
      save_info(@accounts, @transactions)
    else
      @accounts = current_user.customer.connection.accounts
      # @transactions = current_user.customer.transactions
    end
  end

  private

  def save_info(accounts, transactions)
    ActiveRecord::Base.transaction do
      connection = current_user.customer.connection
      acc_attributes = Account.new.attributes
      tra_attributes = Transaction.new.attributes

      accounts.each do |a|
        prep_attrs = a.select { |k| acc_attributes.include? k }
        connection.accounts.create(prep_attrs)
      end
      transactions.each do |t|
        prep_attrs = t.select { |k| tra_attributes.include? k }
        connection.accounts.find(t['account_id'])&.transactions.create(prep_attrs)
      end
    end
  end
end
