class CategoriesController < ApplicationController
	def index
		@categories = Category.latest
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
      flash[:notice] = 'Data Has Been Created'
    else
      flash[:error] = 'Data Has Been not Created'
    end
		redirect_to categories_path
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		@category.save
		redirect_to categories_path
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :back
	end

	private
		def category_params
			params.require(:category).permit(:id, :name, :ancestry)
		end

end