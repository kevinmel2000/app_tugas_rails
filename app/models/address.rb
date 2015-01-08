class Address < ActiveRecord::Base
	belongs_to :users
	belongs_to :addressable, polymorphic: true
end
