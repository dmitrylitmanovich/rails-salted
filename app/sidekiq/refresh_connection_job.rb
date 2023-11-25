class RefreshConnectionJob
  include Sidekiq::Job

  def perform(*args)
    username = 'username'
    password = 'secret'
    connections = Connection.where(next_refresh_possible_at < DateTime.now)
    connections.each do |connection|
      DoActionOnConnection.call(
        do_action: do_action,
        connection_id: connection_id,
        username: username,
        password: password
    )
    end
  end
end
