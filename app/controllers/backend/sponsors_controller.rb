class Backend::SponsorsController < Backend::ApplicationBackendController
	def index
		@sponsors = Sponsor.all
	end

	def new
		@sponsor = Sponsor.new
	end

	def create
		@sponsor = Sponsor.new(sponsor_params)
		@sponsor.save
		redirect_to backend_sponsors_path
	end

	def edit
		@sponsor = Sponsor.find(params[:id])
	end

	def update
		@sponsor = Sponsor.find(params[:id])
		@sponsor.update(sponsor_params)
		@sponsor.save
		redirect_to backend_sponsors_path
	end

	def destroy
		@sponsor = Sponsor.find(params[:id])
		@sponsor.destroy
		redirect_to :back
	end

	private
		def sponsor_params 
			params.require(:sponsor).permit(:id, :title, :link_url, :brithday, :image)
		end
end