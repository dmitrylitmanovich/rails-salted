FactoryBot.define do
  factory :account do
    connection_id { }
    name { Faker::Bank.account_number(digits: 16) }
    currency { Faker::Currency.code }
    balance { Faker::Number.decimal(l_digits: 2) }
    nature { 'credit_card' }
  end
end
  