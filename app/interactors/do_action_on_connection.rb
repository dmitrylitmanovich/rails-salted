require "rest-client"

class DoActionOnConnection
  include Interactor

  ACTIONS = OpenStruct.new({
    remove: {
      method: :delete,
      query: nil,
      payload: nil
    },
    reconnect: {
      method: :put,
      query: 'reconnect',
      payload: {
                  data: {
                    consent: {
                      scopes: [
                        :account_details
                      ]
                    },
                    override_credentials: true,
                    credentials: {
                      login: 'username',
                      password: 'secret'
                    }
                  }
                },
    },
    refresh: {
      method: :put,
      query: 'refresh',
      payload: {
        data: {
          attempt: {
            fetch_scopes: [
              'accounts',
              'transactions'
            ] 
          } 
        } 
      }
    }
  })

  def call
    action = match_action()[context.do_action
    conn = Faraday.new(
      url:     "#{ENV['SALTEDGE_API_URL']}/connections/#{context.connection_id}/#{action.query}",
      headers: {
        'Accept'       => 'application/json',
        'Content-type' => 'application/json',
        'App-id'       => ENV['AI_API_APP_ID'],
        'Secret'       => ENV['AI_API_SECRET'],
      }
    )
    response = conn.post do |req|
      req.body = action.payload.to_json
    end

    context.data = JSON.parse(response.body)['data']
  end

  def rollback
  end

  private

  def match_action
    json = ACTIONS.to_json
    JSON.parse(json, object_class: OpenStruct).table
  end
end
