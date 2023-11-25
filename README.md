SaltEdge Integration

- Deployed on fly.io: https://rails-saltedapp.fly.dev/

- Create a user in the system using Devise gem
- Create a Salt Edge customer for the user (on user registration)
- Create a Salt Edge connection for that customer (use provider with code
fake_bank_simple_xf)
- Import accounts and transactions (posted and pending) for that connection
- Allow user to refresh/ reconnect/ destroy connection
- Refresh connections in a background job (untested)
- Deploy the app to Heroku (or other publicly available platform)
- *(undone)* Use Salt Edge callbacks to update connections’ status
- Cover all the models(unneeded)/controllers with tests for all their methods. - *base*
- *(undone)* Write feature/integration specs.
- *(undone)* Use a separate class that will handle all requests to Gateway API, cover it with
tests.
