class Connection < ApplicationRecord
  belongs_to :customer
  has_many :accounts
  has_many :transactions

  enum :status, %i(active, inactive), _suffix: true
end
