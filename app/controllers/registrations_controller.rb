class RegistrationsController < Devise::RegistrationsController

	def create
    super do
      resource.type = 'Member'
      resource.save
    end
  end

end