require 'rest-client'
require 'ostruct'

class RetrieveResource
  include Interactor

  RESOURCES = OpenStruct.new({
    accounts: {
      path: 'accounts',
      required_param: 'connection_id'
    },
    connections: {
      path: 'connections',
      required_param: 'customer_id'
    },
    transactions: {
      path: 'transactions',
      required_param: 'connection_id'
    },
    customers: {
      path: 'customers',
      required_param: 'customer_id'
    }
  })

  def call
    resource = match_resource()[context.resource]
    conn = Faraday.new(
      url:     "#{ENV['SALTEDGE_API_URL']}/#{resource.path}?#{resource.required_param}=#{context.required_resource_id}",
      headers: {
        'Accept'       => 'application/json',
        'Content-type' => 'application/json',
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )
    response = conn.get do |req|
      req.body = action.payload.to_json
    end

    context.data = JSON.parse(response.body)['data']
  end

  def rollback
  end

  private

  def match_resource
    json = RESOURCES.to_json
    JSON.parse(json, object_class: OpenStruct).table
  end
end
