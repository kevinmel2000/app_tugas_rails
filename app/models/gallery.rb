class Gallery < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}

	has_attached_file :file, :styles => {
                                          :big    => "1024x860>",
                                          :medium => "860x460>",
                                          :normal => "460x260>",
                                          :thumb  => "125x125>"
                                        },
                                        :default_url => "/assets/noimage.jpg"

  validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"],
                                               :size => { :in => 0..1024.kilobytes } }
end
