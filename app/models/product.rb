class Product < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}
	belongs_to :category, foreign_key: 'category_id'
end
