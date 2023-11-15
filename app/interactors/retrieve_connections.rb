require "rest-client"

class RetrieveConnections
  include Interactor

  def call
    response = RestClient::Request.execute(
      method:  :get,
      url:     "#{ENV['SALTEDGE_API_URL']}/connections?customer_id=#{context.customer_id}",
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
