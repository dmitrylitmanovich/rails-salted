FactoryBot.define do
  factory :customer do
    user_id { }
    customer_id { }
    identifier { Faker::Internet.email }


    after(:build) do |customer|
      customer.connections << build(:connection, customer: customer)
    end
  end
end
