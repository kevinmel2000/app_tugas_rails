class PublicsController < ApplicationController
	def home
		root = Product.latest

		@hot_ads = root.verified.limit(16)
		@latest_ads = root.limit(16)
	end

	def catalog
		@product = Product.latest.page(params[:page]).per(10)
		render layout: 'application_catalog'
	end

	def results
		@products = Product.latest.page(params[:page]).per(10).filter_search(params)

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