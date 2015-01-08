class Product < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}

	has_many :galleries, as: :galleriable, dependent: :destroy
	accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

	has_one :addresses, as: :addressable, dependent: :destroy
	accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

	belongs_to :category, foreign_key: 'category_id'

	def verified
		if self.status == true
			"<div class='label label-success'>ACTIVE</div>".html_safe
		else
			"<div class='label label-danger'>NONAKTIVE</div>".html_safe
		end
	end
end
