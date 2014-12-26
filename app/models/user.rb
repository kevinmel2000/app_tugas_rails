class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # has one profile => 'Full_name','avatar','gender','birthday','phone'

  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
    
  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => auth.info.email).first
      
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(username:auth.extra.raw_info.name,
  #                           provider:auth.provider,
  #                           uid:auth.uid,
  #                           email:auth.info.email,
  #                           password:Devise.friendly_token[0,10],
  #                           confirmation_token: nil,
  #                           confirmed_at: Time.now
  #                         )
  #     end
  #   end
  # end
end
