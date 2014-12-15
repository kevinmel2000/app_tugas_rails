class ProvincesController < ApplicationController
	def index
		@provinces = Province.latest
	end

	def new
		@province = Province.new
	end

	def create
		@province = Province.new(province_params)
		if @province.save
      flash[:notice] = 'Data Has Been Created'
    else
      flash[:error] = 'Data Has Been not Created'
    end
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
			params.require(:province).permit(:id, :name, :ancestry)
		end
end