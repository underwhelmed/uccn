class Document < ActiveRecord::Base
  has_attached_file :file, 
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS,
                    :bucket => "uccnws-" + Rails.env,
                    :s3_protocol => 'https',                    
                    :s3_permissions => :private,
                    :path => lambda { |file| ":id_partition/:filename" },
                    :processors => [:noop]
                    
  # http://www.metaskills.net/2009/11/23/authenticated-s3-gets-for-private-objects-using-paperclip/
 
  attr_accessible :name, :description, :allow_download, :file

  validates_presence_of :name, :description
  validates_length_of :name, :maximum => 100
  validates_length_of :description, :maximum => 255  
  validates_attachment_presence :file
  
  scope :active, lambda {
    where("documents.allow_download = ?", :true)
  }
  
  def attachment_url
    "/members/#{self.class.name.downcase.pluralize}/#{id}/#{file_file_name}"
  end
  
  def authenticated_s3_get_url(expires = nil)
    expires ||= 10.minutes.from_now
    url = attachment.send(:directory).files.get_http_url attachment.path, expires
    url.gsub! /s3.amazonaws.com\//, ''
  end

end
