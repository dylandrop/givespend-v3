conf = YAML::load(File.open("#{Rails.root}/config/s3.yml"))
S3_BUCKET = conf[Rails.env.to_s]['bucket']
S3_ACCESS_KEY_ID = conf[Rails.env.to_s]['access_key_id']
S3_SECRET_ACCESS_KEY = conf[Rails.env.to_s]['secret_access_key']