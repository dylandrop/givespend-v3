conf = YAML::load(File.open("#{Rails.root}/config/stripe.yml"))
STRIPE_PUBLIC = conf[Rails.env.to_s]['stripe_public']
Stripe.api_key = conf[Rails.env.to_s]['stripe_secret']

puts conf[Rails.env]

Devise.setup do |config|
  config.omniauth :stripe_connect, conf[Rails.env.to_s]['client_id'], conf[Rails.env.to_s]['stripe_secret'], :scope => 'read_write', :stripe_landing => 'register'
end