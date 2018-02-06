Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8080', 'localhost:5000', 'tourney-golf.com', 'www.tourney-golf.com', 'tourney-ui.herokuapp.com'
    resource '*',
      headers: ['Origin', 'Accept', 'Content-Type', 'X-Requested-With', 'Authorization'],
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'auth'],
      methods: %i(get post put patch delete options head)
  end
end