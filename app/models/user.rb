class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_initialize :after_initialized

  has_one :profile, foreign_key: 'user_id', :dependent => :destroy
  has_one :address, foreign_key: 'user_id'

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :address

  def admin?
    self.type == 'Admin'
  end

  def member?
    self.type == 'Member'
  end

  protected 
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
      self.address = Address.new if self.address.blank?
    end
end
