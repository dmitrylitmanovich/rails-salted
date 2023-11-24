require "rest-client"

class RetrieveCustomersList
  include Interactor

  def call
    response = RestClient::Request.execute(
      method:  :get,
      url:     "#{ENV['SALTEDGE_API_URL']}/customers",
      log: Logger.new(STDOUT),
      headers: {
        "Accept"       => "application/json",
        "Content-type" => "application/json",
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )

    response_data = JSON.parse(response.body)['data']

    context.identifiers = response_data.pluck('identifier')
  end

  def rollback
  end
end
