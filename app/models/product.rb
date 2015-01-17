class Product < ActiveRecord::Base

	extend FriendlyId

	friendly_id :title, use: [:slugged, :finders]

	include ProductSearching
	include ProductScope

	def after_initialized
    self.product_property = ProductProperty.new if self.product_property.blank?
    self.bike_property    = BikeProperty.new if self.bike_property.blank?
    self.car              = Car.new if self.car.blank?
    self.gadget           = Gadget.new if self.gadget.blank?
    self.address          = Address.new if self.address.blank?
  end

  private
  	def populate_galleries
  		(1..2).each do |index|
  			new_cover = self.galleries.new
  		end if self.galleries.blank?
  	end
end
