if ENV["RAILS_ENV"] == "development"
  keys = YAML.load(File.open("secret/keys.yml"))
else

  keys = {}
  keys[:password_salt] = ENV["PASSWORD_SALT"]
  keys[:twitter_consumer_key] = ENV["TWITTER_CONSUMER_KEY"]
  keys[:twitter_consumer_secret] = ENV["TWITTER_CONSUMER_SECRET"]
  keys[:twitter_oauth_token] = ENV["TWITTER_OAUTH_TOKEN"]
  keys[:twitter_oauth_token_secret] = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
end

Twitter.configure do |config|
  config.consumer_key = keys["twitter_consumer_key"]
  config.consumer_secret = keys["twitter_consumer_secret"]
  config.oauth_token = keys["twitter_oauth_token"]
  config.oauth_token_secret = keys["twitter_oauth_token_secret"]
end