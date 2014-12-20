class ProductsController < ApplicationController
	before_filter :choice_status

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
		redirect_to products_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		@product.save
		redirect_to products_path
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :back
	end

	private
		def choice_status
      @choice_status = [ "true", "false"]
    end
    
		def product_params
			params.require(:product).permit(:id, :title, :description, :price, :category_id, :status, :user_id)
		end
end