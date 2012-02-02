class Picture < ActiveRecord::Base
  belongs_to :album

  attr_accessible :name, :order
  
  has_attached_file :photo, :styles => {
                                          :thumb  => "100x100#",
                                          :small  => "150x150>",
                                          :mid    => "640x640>",
                                          :large  => "800x800>"
                                        }
end