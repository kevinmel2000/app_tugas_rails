class Product < ActiveRecord::Base

	extend FriendlyId

	friendly_id :title, use: [:slugged, :finders]

	scope :latest, ->{order(created_at: :desc)}
	scope :oldest, ->{order(created_at: :asc)}
	scope :updated, ->{order(updated: :desc)}

	after_initialize :populate_galleries

	has_one :product_property
	accepts_nested_attributes_for :product_property
	
	has_one :car
	accepts_nested_attributes_for :car

	has_one :gadget
	accepts_nested_attributes_for :gadget

	has_one :bike_property
	accepts_nested_attributes_for :bike_property

	has_one :address, as: :addressable, dependent: :destroy
	accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true

	has_many :galleries, as: :galleriable, dependent: :destroy
	accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

	belongs_to :category, foreign_key: 'category_id'

	after_initialize :after_initialized

	def verified
		if self.status == true
			"<div class='label label-success'>ACTIVE</div>".html_safe
		else
			"<div class='label label-danger'>NONAKTIVE</div>".html_safe
		end
	end

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
