class Picture < ActiveRecord::Base
  belongs_to :album

  validates_presence_of :name, :order, :album_id 
  
  attr_accessible :name, :order
  
  has_attached_file :photo, 
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS,
                    :bucket => "uccnws-" + Rails.env,
                    :path => ":id/:album_id/:style/:filename",
                    :styles => {
                                :thumb  => "100x100#",
                                :small  => "150x150>",
                                :mid    => "640x640>",
                                :large  => "800x800>"
                    }
                    
  validates_attachment_size :photo, :less_than => 7.megabytes                                      
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/pjpeg', 
                                    'image/jpg', 'image/png', 'image/gif']
end