class Member < User
	default_scope { where(type: 'Member')}
end
