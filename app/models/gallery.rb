class Gallery < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}

	has_attached_file :file, {
    :styles => {
    :thumb  => ["50x50#", :png],
    :medium => ["100x100#", :png],
    :large  => ["300x300>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :thumb => "-gravity Center -crop 100x100+0+0",
    }, :default_url => "/assets/noimage.jpg"
  }
  validates_attachment_content_type :file, :content_type => %w(image/jpeg image/jpg image/png)
end
