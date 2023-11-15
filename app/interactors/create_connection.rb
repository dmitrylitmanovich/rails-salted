require "rest-client"

class CreateConnection
  include Interactor

  def call
    response = RestClient::Request.execute(
      method:  :post,
      url:     "#{ENV['SALTEDGE_API_URL']}/connections",
      payload: {
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
      },
      log: Logger.new(STDOUT),
      headers: {
        'Accept'       => 'application/json',
        'Content-type' => 'application/json',
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )

    context.data = JSON.parse(response.body)['data']
  end

  def rollback
  end
end
