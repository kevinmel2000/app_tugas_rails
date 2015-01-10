class Product < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}

	belongs_to :product_property

	def verified
		if self.status == true
			"<div class='label label-success'>ACTIVE</div>".html_safe
		else
			"<div class='label label-danger'>NONAKTIVE</div>".html_safe
		end
	end
end
