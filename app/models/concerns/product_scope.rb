module ProductScope
	extend ActiveSupport::Concern
	included do 
		scope :verified, ->{where(status: true)}
		scope :latest, ->{order(created_at: :desc)}
		scope :oldest, ->{order(created_at: :asc)}
		scope :updated, ->{order(updated: :desc)}
		scope :car, ->{where(catalog_type: 'Mobil')}
		scope :bike, ->{where(catalog_type: 'Motor')}
		scope :gadget, ->{where(catalog_type: 'Gadget')}
		scope :property, ->{where(catalog_type: 'Property')}
		scope :condition, ->{where(condition: 'Condition')}


		scope :bonds, -> {
	  	eager_load(:bike_property, :car, :gadget, :product_property)
	  }

	  scope :bonds_address, ->{
	  	eager_load(:address)
	  }

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
	end
end