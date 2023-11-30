FactoryBot.define do
    factory :account do
      connection_id: nil
      account_id: nil
      name: "5325 **** **** 1285"
      currency: nil
      balance: -2012.15
      nature: :credit_card
      extra: {
        "status"=>"active",
        "card_type"=>"master_card",
        "client_name"=>"John Smith",
        "expiry_date"=>"2025-11-01",
        "account_name"=>"**** 1285 MasterCard",
        "credit_limit"=>10000.0,
        "blocked_amount"=>15.0,
        "closing_balance"=>-1006.08,
        "available_amount"=>7972.85,
        "next_payment_date"=>"2023-12-05",
        "transactions_count"=>{"posted"=>0, "pending"=>0},
        "next_payment_amount"=>134.14
      }
    end
  end
  