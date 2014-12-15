class Category < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}
end
