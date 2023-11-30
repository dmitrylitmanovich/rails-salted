FactoryBot.define do
    factory :connection do
      customer_id { }
      last_success_at { nil }
      next_refresh_possible_at { nil }
      provider_id { 68 }
      provider_code { 'fakebank_simple_xf' }
      provider_name { Faker::Bank.name }
      store_credentials { true }

      after(:build) do |connection|
        connection.accounts << build(:account, connection: connection)
      end
    end
  end
  