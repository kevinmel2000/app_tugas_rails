class Backend::CategoriesController < Backend::ApplicationBackendController

	def index
		@categories = Category.arrange_as_array({:order => 'name'})
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to backend_categories_path
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		@category.save
		redirect_to backend_categories_path
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :back
	end

	private
		def category_params
			params.require(:category).permit(:id, :name, :parent_id)
		end

end