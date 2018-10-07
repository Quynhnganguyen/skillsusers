class Skill < ApplicationRecord
	has_many :skills_users
	has_many :users
  	has_many :childs, class_name: "Skill", foreign_key: :parent_id
  	belongs_to :parent, class_name: "Skill"

	def users
		skills_users.map(&:user)
	end

	def points
		users.map(&:points).map(&:to_i).reduce(0, :+) + childs.map(&:points).map(&:to_i).reduce(0, :+)
	end

	def users_count
		users.count + childs.map(&:users).flatten.count
	end

	private
end
