if ENV["RAILS_ENV"] == "development"
  yaml = YAML.load(File.open("secret/keys.yml"))
  yaml.each {|k,v|
    ENV[k] = v
  }
end

Twitter.configure do |config|
  config.consumer_key = ENV["twitter_consumer_key"]
  config.consumer_secret = ENV["twitter_consumer_secret"]
  config.oauth_token = ENV["twitter_oauth_token"]
  config.oauth_token_secret = ENV["twitter_oauth_token_secret"]
end