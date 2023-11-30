class Customer < ApplicationRecord
  belongs_to :user
  has_many :connections
  has_many :accounts, through: :connections
end
