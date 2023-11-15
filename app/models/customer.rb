class Customer < ApplicationRecord
  belongs_to :user
  has_one :connection
end
