class UsersController < ApplicationController
	before_action :set_request_body_to_params
	include RecordManager

	def create_all
		@response = []
		params['users'].each do |user|
			@response << create_record('user', user)
		end
		send_response
	end

	def add_skills_to_various
		@response = []
		params['skills_users'].each do |skill_user|
			@response << create_record('skills_users', skill_user)
		end
		send_response
	end
	private
end
