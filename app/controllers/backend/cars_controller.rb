class Backend::CarsController < Backend::ApplicationBackendController

	def index
		@cars = Car.all
	end
	def new
		@car = Car.new
	end
	def create
		@car = Car.new(car_params)
		@car.save
		redirect_to backend_cars_path
	end
	def edit
	@car = Car.find(params[:id])
		
	end
	def update
		@car = Car.find(params[:id])
		@car.update(car_params)
		@car.save
		redirect_to backend_cars_path
		
	end
	def destroy
		@car = Car.find(params[:id])
		@car.destroy
		redirect_to :back
	end
	private

	def car_params
		params.require(:car).permit(:id, :transmission, :kilometer, :seat, :door, :color, :production_year, :number_plate, :engine, :fuel)
	end
end
