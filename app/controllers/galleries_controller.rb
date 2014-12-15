class GalleriesController < ApplicationController
	def index
		@galleries = Gallery.latest
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = Gallery.new(gallery_params)

		if @gallery.save
      flash[:notice] = 'Data Has Been Created'
    else
      flash[:error] = 'Data Has Been not Created'
    end
    redirect_to galleries_path
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		@gallery.update(gallery_params)
		@gallery.save
		redirect_to galleries_path
	end

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		redirect_to :back
	end

	private
		def gallery_params
			params.require(:gallery).permit(:id, :title, :file_file_name, :file_content_type, :file_file_size, :file_updated_at, :galleriable_type, :galleriable_id)
		end

end