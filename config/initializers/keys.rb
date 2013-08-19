if ENV["RAILS_ENV"] == "development"
  yaml = YAML.load(File.open("secret/keys.yml"))
  yaml.each {|k,v|
    ENV[k] = v
  }
end