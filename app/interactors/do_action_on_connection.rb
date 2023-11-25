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
                      login: context.username,
                      password: context.password
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
    action = match_resource()[context.do_action]
    # do_action: do_action, connection_id: connection_id
    response = RestClient::Request.execute(
      method:  action.method,
      url:     "#{ENV['SALTEDGE_API_URL']}/connections/#{context.connection_id}" + action.query,
      payload: action.payload,
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

  private

  def match_action
    json = ACTIONS.to_json
    JSON.parse(json, object_class: OpenStruct).table
  end
end
