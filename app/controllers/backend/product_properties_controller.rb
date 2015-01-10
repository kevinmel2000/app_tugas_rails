class Backend::ProductPropertiesController < Backend::ApplicationBackendController
	
	def index
		@productproperties = ProductProperty.all
	end

	def new
		@productproperty = ProductProperty.new
	end

	def create
		@productproperty = ProductProperty.new(productproperty_params)
		@productproperty.save
		redirect_to backend_product_properties_path
	end

	def edit
		@productproperty = ProductProperty.find(params[:id])
	end

	def update
		@productproperty = ProductProperty.find(params[:id])
		@productproperty.update(productproperty_params)
		@productproperty.save
		redirect_to backend_product_properties_path
	end

	def destroy
		@productproperty = ProductProperty.find(params[:id])
		@productproperty.destroy
		redirect_to :back
	end

	private
		def productproperty_params 
			params.require(:product_property).permit(:id, :building_area, :surface_area, :bathroom, :bedroom, :certificate, :interior, :electrical_power, :birth_year, :parent_id,
																						    product_attributes: [
																						    	:id,
																						    	:title,
																						    	:description,
																						    	:price,
																						    	:status,
																						    	:_destroy
																						    ],
																						    addresses_attributes: [
																					      	:id,
																					      	:province,
																									:city,
																									:address,
																									:postcode,
																									:country,
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
																					      ])
		end
end