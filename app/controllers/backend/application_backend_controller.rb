class Backend::ApplicationBackendController < ApplicationController
	layout 'application_backend'

	before_filter :authenticate_admin!

	def authenticate_admin!
		unless current_user.present? && (current_user.admin?)
			redirect_to root_path	
		end	
	end
end
