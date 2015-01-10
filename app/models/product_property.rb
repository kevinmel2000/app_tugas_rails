class ProductProperty < ActiveRecord::Base
	has_one :product

	has_one :addresses, as: :addressable, dependent: :destroy
	accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

	has_many :galleries, as: :galleriable, dependent: :destroy
	accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

	belongs_to :category, foreign_key: 'category_id'
end
