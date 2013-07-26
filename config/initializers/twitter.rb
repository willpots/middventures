config = YAML.load(File.open("secret/keys.yml"))

Twitter.configure do |config|
  config.consumer_key = config["twitter_consumer_key"]
  config.consumer_secret = config["twitter_consumer_secret"]
  config.oauth_token = config["twitter_oauth_token"]
  config.oauth_token_secret = config["twitter_oauth_token_secret"]
end