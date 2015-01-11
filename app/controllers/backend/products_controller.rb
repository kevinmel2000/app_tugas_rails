class Backend::ProductsController < Backend::ApplicationBackendController
	helper_method :products_category_options 

	def index
		# @articles = Article.order(created_at: :desc)
		@products = Product.latest
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to backend_products_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		@product.save
		redirect_to backend_products_path
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :back
	end

	private
    
		def product_params
			params.require(:product).permit(:id, :title, :description, :price, :category_id, :status, :user_id, :parent_id, 
																				product_property_attributes: [
																	      	:id,
																	      	:building_area,
																					:surface_area,
																					:bathroom,
																					:bedroom,
																					:certificate,
																					:interior,
																					:electrical_power,
																					:birth_year,
																					:product_id,
																					:_destroy
																	      ],
																	      car_attributes: [
																	      	:id,
																	      	:transmission,
																	      	:kilometer,
																	      	:seat,
																	      	:door,
																	      	:production_year,
																	      	:number_plate,
																	      	:engine,
																	      	:fuel,
																	      	:product_id
																	      ],
																	      gadget_attributes: [
																	        :id,
																	        :sku,
																	        :shipping_weight,
																	        :waranty,
																	        :color,
																	        :processor,
																	        :Os,
																	        :sim,
																	        :memory,
																	        :camera,
																	        :dimension,
																	        :display,
																	        :network,
																	        :battery,
																	        :_destroy
																	      ],
																				galleries_attributes: [
																	        :id,
																	        :title,
																	        :file,
																	        :galleriable_type,
																	        :galleriable_id,
																	        :galleriable,
																	        :_destroy
																	      ],
																	      bike_property_attributes: [
																	        :id,
																	        :brand,
																	        :manufacture,
																	        :bike_type,
																	        :color,
																	        :condition,
																	        :product_id,
																	        :_destroy
																	      ],
																	      address_attributes: [
																	      	:id,
																	      	:province,
																					:city,
																					:address,
																					:postcode,
																					:country,
																					:_destroy
																	      ])
		end

	  def products_category_options
	    @products_category_options ||= Category.all.map{|category| [category.name, category.id] }
	  end
end