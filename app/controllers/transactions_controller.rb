class TransactionsController < ApplicationController
  def index
    @transactions = Account.find(params[:account_id]).transactions
  end
end
