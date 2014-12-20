class Province < ActiveRecord::Base
	scope :latest, ->{order(created_at: :desc)}
	include Tree
end
