class MembersController < ApplicationController
	prepend_before_filter :draw_password, only: :update
	before_action :set_object
	before_filter :sex

	def member_home
		render layout: 'application_member'
	end

	def member_profile
		render layout: 'application_member'
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:notice] = "Succesfully updated profile!"
			redirect_to user_profile_path
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to user_profile_path
		end
	end

	private
		def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end

		def set_object
			@user = current_user
		end

		def sex
			sex = ['Laki-laki','Perempuan']			
			@sex = sex.map{|sex| [sex, sex]}
		end
end