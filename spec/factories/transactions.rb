FactoryBot.define do
    factory :transaction do
    account_id: nil
    transaction_id: nil
    transaction_status: nil
    currency: nil
    amount: -0.0227846975
    description: "15 NOV 23 SAINSBURYS NEWPORT NP10 GBR GBR"
    category: "groceries"
    mode: :normal
    extra: {
      "payee"=>"DE12345678912345678912",
      "payer"=>"GB33BUKB20201555555555",
      "convert"=>true,
      "merchant_id"=>"9cbad643f41441cdcdee460c829efa72b9d3c803e25a372ff9e5614be203ee56",
      "original_amount"=>-2.55,
      "payee_information"=>"Sample merchant",
      "payer_information"=>"John Smith",
      "original_currency_code"=>"RUB",
      "account_balance_snapshot"=>2015.28,
      "categorization_confidence"=>1
    }
    end
  end
  