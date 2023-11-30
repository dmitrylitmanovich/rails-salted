class ConnectionInfoController < ApplicationController
  def index
    connection_id = params[:connection_id]

    if current_user.customer&.accounts&.empty?
      @accounts = RetrieveResource.call(resource: 'accounts', required_resource_id: connection_id).data
      @transactions = RetrieveResource.call(resource: 'transactions', required_resource_id: connection_id).data
      save_info(@accounts, @transactions)
    else
      @accounts = current_user.customer.accounts
    end
  end

  private

  def save_info(accounts, transactions)
    ActiveRecord::Base.transaction do
      acc_attributes = Account.new.attributes
      tra_attributes = Transaction.new.attributes

      current_user.customer&.accounts&.each do |a|
        prep_attrs = a.select { |k| acc_attributes.include? k }
        current_user.customer.accounts.create(prep_attrs)
      end
      transactions&.each do |t|
        prep_attrs = t.select { |k| tra_attributes.include? k }
        current_user.customer.accounts.find(t['account_id'])&.transactions.create(prep_attrs)
      end
    end
  end
end
