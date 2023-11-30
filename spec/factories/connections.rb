FactoryBot.define do
    factory :connection do
      customer_id: nil
      data: {}
      last_success_at: nil
      next_refresh_possible_at: nil
      provider_id: 68
      provider_code: :fakebank_simple_xf
      provider_name: 'Fake Bank Simple'
      status: :active
      store_credentials: true
    end
  end
  