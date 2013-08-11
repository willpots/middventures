keys = YAML.load(File.open("secret/keys.yml"))

Twitter.configure do |config|
  config.consumer_key = keys["twitter_consumer_key"]
  config.consumer_secret = keys["twitter_consumer_secret"]
  config.oauth_token = keys["twitter_oauth_token"]
  config.oauth_token_secret = keys["twitter_oauth_token_secret"]
end