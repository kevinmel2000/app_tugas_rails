class ProvincesController < ApplicationController
	def index
		@provinces = Province.arrange_as_array({:order => 'name'})
	end

	def new
		@province = Province.new
	end

	def create
		@province = Province.new(province_params)
		@province.save
		redirect_to provinces_path
	end

	def edit
		@province = Province.find(params[:id])
	end

	def update
		@province = Province.find(params[:id])
		@province.update(province_params)
		@province.save
		redirect_to provinces_path
	end

	def destroy
		@province = Province.find(params[:id])
		@province.destroy
		redirect_to :back
	end

	private
		def province_params
			params.require(:province).permit(:id, :name, :parent_id)
		end
end