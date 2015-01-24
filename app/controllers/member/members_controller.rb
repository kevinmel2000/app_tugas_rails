class Member::MembersController < ApplicationController
	prepend_before_filter :draw_password, only: :update
	before_action :set_object
	before_filter :sex

	def home
		render layout: 'application_member'
	end

	def profile
		render layout: 'application_member'
	end

	def update
		@user = Member.find(current_user)
		@user.update(members_params)
		@user.save

    if @user
      flash[:notice] = "Successfully updated profile!"
      redirect_to member_profile_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to member_profile_path
    end
  end

	private

		def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end

		def set_object
			@member = current_user
		end

		def sex
			sex = ['Laki-laki','Perempuan']			
			@sex = sex.map{|sex| [sex, sex]}
		end

		def members_params
			params.require(:member).permit(:id, :username, :email, :password, :password_confirmation, 
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
end