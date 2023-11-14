class Connection < ApplicationRecord
  enum :status, %i(active, inactive), _suffix: true
end
