require "rest-client"

class CreateCustomer
  include Interactor

  def call
    conn = Faraday.new(
      url:     "#{ENV['SALTEDGE_API_URL']}/customers",
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
          identifier: context.user_email
        }
      }.to_json
    end

    context.data = JSON.parse(response.body)['data']
  end

  def rollback
  end
end
