conf = YAML::load(File.open("#{Rails.root}/config/mailjet.yml"))
Mailjet.configure do |config|
  config.api_key = conf[Rails.env.to_s]['mailjet_api_key']
  config.secret_key = conf[Rails.env.to_s]['mailjet_secret_key']
  config.default_from = 'Givespend <admin@givespend.com>'
end