require "rest-client"

class CreateCustomer
  include Interactor

  def call
    response = RestClient::Request.execute(
      method:  :post,
      url:     "#{ENV['SALTEDGE_API_URL']}/customers",
      payload: {
        data: {
          identifier: context.user_email
        }
      },
      log: Logger.new(STDOUT),
      headers: {
        "Accept"       => "application/json",
        "Content-type" => "application/json",
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )

    context.data = JSON.parse(response.body)['data']
  end

  def rollback
  end
end
