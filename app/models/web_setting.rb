class WebSetting < ActiveRecord::Base
	# attr_accessible :title, :description, :keywords, :header_tags, :footer_tags, :phone, :email, :logo, :pavicon

	has_many :galleries, as: :galleriable, dependent: :destroy
	accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

	has_attached_file :favicon,
    :styles => {
      :thumb  => "50x50#",
      :medium => "100x100#",
      :large  => "300x300#"
    },
    :default_url => "../assets/noimage.jpg"

  has_attached_file :logo,
    :styles => {
      :thumb  => "50x50#",
      :medium => "100x100#",
      :large  => "300x300#"
    },
    :default_url => "../assets/noimage.jpg"
  
  validates_attachment :favicon, content_type:{ content_type: ["image/jpeg", "image/jpg", "image/png"] }
  validates_attachment :logo, content_type:{ content_type: ["image/jpeg", "image/jpg", "image/png"] }
end
