class PublicsController < ApplicationController
	def home
	end

	def catalog
		@product = Product.all.page(params[:page]).per(2)
		render layout: 'application_catalog'
	end

	def single_post	
	end

	def about_us
	end

	def forum_diskusi
	end

	def contact
	end

	def questions
	end

	def sign_in
	end

	def sign_up
	end
end