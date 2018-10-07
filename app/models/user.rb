class User < ApplicationRecord
	has_one :skills_user
	delegate :skill, to: :skills_user
end
