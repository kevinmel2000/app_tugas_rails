class Category < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}
	include Tree
	
	has_many :products, foreign_key: 'category_id'
	# has_many :products_property, foreign_key: 'category_id'
end
