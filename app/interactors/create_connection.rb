require "rest-client"

class CreateConnection
  include Interactor

  def call
    conn = Faraday.new(
      url:     "#{ENV['SALTEDGE_API_URL']}/connections",
      headers: {
        'Accept'       => 'application/json',
        'Content-type' => 'application/json',
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )
    response = conn.post do |req|
      req.body = {
        data: {
          customer_id: context.customer_id,
          country_code: 'XF',
          provider_code: 'fakebank_simple_xf',
          consent: {
            from_date: Date.today,
            scopes: [
              'account_details',
              'transactions_details'
            ]
          },
          attempt: {
            from_date: Date.today,
            fetch_scopes: [
              'accounts',
              'transactions'
            ],
            custom_fields: {
              test: true
            }
          },
          credentials: {
            login: context.username,
            password: context.password
          }
        }
      }.to_json
    end

    data = JSON.parse(response.body)['data']
    context.data = data
    context
  end

  def rollback
  end
end
