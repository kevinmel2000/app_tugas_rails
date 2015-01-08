class Profile < ActiveRecord::Base
	belongs_to :users
	has_one :address

	has_attached_file :avatar,
    :styles => {
      :thumb  => "50x50#",
      :medium => "100x100#",
      :large  => "300x300#"
    },
    :default_url => "/assets/no-image.jpg"
  
  validates_attachment :avatar, content_type:{ content_type: ["image/jpeg", "image/jpg", "image/png"] }
end
