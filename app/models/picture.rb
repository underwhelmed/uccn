class Picture < ActiveRecord::Base
  belongs_to :album

  validates_presence_of :order
  
  attr_accessible :order, :photo
  
  has_attached_file :photo, :whiny => false,
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS,
                    :bucket => "uccnws-" + Rails.env,
                    :path => "albums/:album_id/:id/:style/:filename",
                    :styles => {
                                :thumb  => "100x100#",
                                :small  => "256x256>",
                                :mid    => "640x640>",
                                :large  => "800x800>"
                    }
                    
  validates_attachment_size :photo, :less_than => 5.megabytes                                      
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