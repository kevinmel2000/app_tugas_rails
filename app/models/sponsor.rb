class Sponsor < ActiveRecord::Base
	has_attached_file :image,
    :styles => {
      :thumb  => "50x50#",
      :medium => "100x100#",
      :large  => "300x300#"
    },
    :default_url => "/assets/no-image.jpg"
  
  validates_attachment :image, content_type:{ content_type: ["image/jpeg", "image/jpg", "image/png"] }
end
