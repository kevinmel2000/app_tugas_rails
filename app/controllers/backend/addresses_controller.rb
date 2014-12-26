class Backend::AddressesController < Backend::ApplicationBackendController
	def index
		@addresses = Address.all
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.save
		redirect_to backend_addresses_path
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		@address.update(address_params)
		@address.save
		redirect_to backend_addresses_path
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to :back
	end

	private
		def address_params 
			params.require(:address).permit(:id, :province, :city, :address, :postcode)
		end
end