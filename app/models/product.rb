class Product < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}
	# scope :oldest, ->{order(created_at: :asc)}
	# scope :updatedst, ->{order(updated_at: :desc)}
end
