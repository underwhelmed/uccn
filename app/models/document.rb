class Document < ActiveRecord::Base
  has_attached_file :file, :storage => :s3, :s3_credentials => S3_CREDENTIALS, :s3_permissions => :private, :path => "members/:class/:id/:filename"

  attr_accessible :name, :description, :allow_download, :file

  validates_presence_of :name, :description
  validates_length_of :name, :maximum => 100
  validates_length_of :description, :maximum => 255  
  validates_attachment_presence :file
  
  def file_url
    "members/#{self.class.tableize}/#{id}/#{file_file_name}"
  end
  
  def authenticated_s3_get_url(options={})
    options.reverse_merge! :expires_in => 10.minutes, :use_ssl => true
    AWS::S3::S3Object.url_for file.path, file.options[:bucket], options
  end

  scope :active, lambda {
    where(:allow_download => true).order("file_updated_at DESC")
  }
  
end
