class WebSetting < ActiveRecord::Base
	has_many :galleries, as: :galleriable, dependent: :destroy
	accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true
end
