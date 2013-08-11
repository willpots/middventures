if ENV["RAILS_ENV"] == "development"
  ENV = ENV.merge( YAML.load(File.open("secret/keys.yml")) )
end