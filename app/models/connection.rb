class Connection < ApplicationRecord
  belongs_to :customer

  enum :status, %i(active, inactive), _suffix: true
end
