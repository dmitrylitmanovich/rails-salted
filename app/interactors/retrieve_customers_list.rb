class RetrieveCustomersList
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
    response = conn.get

    response_data = JSON.parse(response.body)['data']
    context.data = response_data.to_h { |item| [item['identifier'], item['id']] }
  end

  def rollback
  end
end
