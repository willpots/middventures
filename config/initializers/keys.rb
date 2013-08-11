if ENV["RAILS_ENV"] == "development"
  SECRET_CONFIG = YAML.load(File.open("secret/keys.yml"))
else

  SECRET_CONFIG = {}
  SECRET_CONFIG[:password_salt] = ENV["PASSWORD_SALT"]
  SECRET_CONFIG[:twitter_consumer_key] = ENV["TWITTER_CONSUMER_KEY"]
  SECRET_CONFIG[:twitter_consumer_secret] = ENV["TWITTER_CONSUMER_SECRET"]
  SECRET_CONFIG[:twitter_oauth_token] = ENV["TWITTER_OAUTH_TOKEN"]
  SECRET_CONFIG[:twitter_oauth_token_secret] = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
end
