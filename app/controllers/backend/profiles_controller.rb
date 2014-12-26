class Backend::ProfilesController < Backend::ApplicationBackendController
	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.save
		redirect_to backend_profiles_path
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		@profile.update(profile_params)
		@profile.save
		redirect_to backend_profiles_path
	end

	def destroy
		@profile = Profile.find(params[:id])
		@profile.destroy
		redirect_to :back
	end

	private
		def profile_params 
			params.require(:profile).permit(:id, :full_name, :avatar, :brithday, :gender, :phone)
		end
end