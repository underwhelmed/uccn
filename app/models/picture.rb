class Picture < ActiveRecord::Base
  belongs_to :album

  validates_presence_of :order
  
  attr_accessible :order, :photo, :album_id
  
  has_attached_file :photo,
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS,
                    :bucket => "uccnws-" + Rails.env,
                    :path => "albums/:id/:style/:filename",
                    :styles => {
                                :thumb  => "100x100#",
                                :small  => "128x128>",
                                :mid    => "480x480>",
                    }
                    
  validates_attachment_size :photo, :less_than => 10.megabytes                                      
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
  before_validation :increment_order
  
  private
    def increment_order
      if self.order.nil?
        self.order = 1
      end
    end
end