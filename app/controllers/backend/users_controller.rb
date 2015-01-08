class Backend::UsersController < Backend::ApplicationBackendController
	before_filter :sex
	before_filter :draw_passwords, only: :update

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
		if @user.save
			flash[:notice] = 'User Has Been Created'
		else
			flash[:error] = user.errors.full_messages
		end
		redirect_to backend_users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(users_params)
		@user.save
		redirect_to backend_users_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :back
	end

	private
		def draw_passwords
			if params[:user] && params[:user][:password].blank?
				params[:user].delete("password")
				params[:user].delete("password_confirmation")
			end
		end

		def users_params
			params.require(:user).permit(:id, :username, :email, :password, :password_confirmation, 
																		profile_attributes: [
																			:id,
																			:full_name,
																			:gender,
																			:birthday,
																			:phone,
																			:avatar,
																			:user_id,
																			:_destroy
																			],
																		address_attributes: [
																			:id,
																			:country,
																			:province,
																			:city,
																			:address,
																			:postcode,
																			:user_id,
																			:_destroy
																			])
		end

		def sex
			sex = ['Laki-Laki', 'Perempuan']
			@sex = sex.map{|sex| [sex, sex]}
		end
end