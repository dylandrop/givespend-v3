class Image < ActiveRecord::Base
  attr_accessible :content, as: [:default, :admin]

  has_attached_file :content,
                    :storage => :s3,
                    :s3_credentials => { 
                      bucket: S3_BUCKET,
                      access_key_id: S3_ACCESS_KEY_ID, 
                      secret_access_key: S3_SECRET_ACCESS_KEY
                    },
                    :path => "/:style/:id/:filename"
  belongs_to :imageable, polymorphic: true
end
