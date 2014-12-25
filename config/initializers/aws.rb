#https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
AWS.config(access_key_id:     Rails.application.secrets.aws_access_key_id,
           secret_access_key: Rails.application.secrets.aws_secret_access_key )

S3_BUCKET = AWS::S3.new.buckets[Rails.application.secrets.s3_bucket]