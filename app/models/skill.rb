class Skill < ApplicationRecord
	has_many :skills_users
	has_many :users

	def users
		skills_users.map(&:user)
	end
end
