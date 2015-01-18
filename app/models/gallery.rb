class Gallery < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}

	belongs_to :galleriable, polymorphic: true
	
	has_attached_file :file,
    :styles => {
      :thumb  => "50x50#",
      :medium => "100x100#",
      :large  => "300x300#"
    },
    :default_url => "noimage.jpg"
  
  validates_attachment :file, content_type:{ content_type: ["image/jpeg", "image/jpg", "image/png"] }
end
