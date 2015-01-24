class Member < User
	after_initialize :after_initialized

	has_one :profile, foreign_key: 'user_id', :dependent => :destroy
  has_one :address, foreign_key: 'user_id'

  validates_uniqueness_of :username

	default_scope { where(type: 'Member')}

	protected 
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
      self.address = Address.new if self.address.blank?
    end
end
