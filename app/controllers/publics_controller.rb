class PublicsController < ApplicationController
	def home
		@products = Product.latest.page(params[:page]).per(4)
	end

	def catalog
		@product = Product.latest.filter_search(params).page(params[:page]).per(10)
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