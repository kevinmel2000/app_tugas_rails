class Backend::WebSettingsController < Backend::ApplicationBackendController
	
	def index
		@web_settings = WebSetting.all
	end

	def new
		@web_setting = WebSetting.new
	end

	def create
		@web_setting = WebSetting.new(web_setting_params)
		@web_setting.save
		redirect_to backend_web_settings_path
	end

	def edit
		@web_setting = WebSetting.find(params[:id])
	end

	def update
		@web_setting = WebSetting.find(params[:id])
		@web_setting.update(web_setting_params)
		@web_setting.save
		redirect_to backend_web_settings_path
	end

	def destroy
		@web_setting = WebSetting.find(params[:id])
		@web_setting.destroy
		redirect_to :back
	end

	private
		def web_setting_params
			params.require(:web_setting).permit(:id, :title, :description, :keywords, :header_tags, :footer_tags, :phone, :email, :facebook_url, :twitter_url, :gplus_url, :parent_id, 
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