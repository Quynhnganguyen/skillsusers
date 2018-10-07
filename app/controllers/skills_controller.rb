class SkillsController < ApplicationController
	before_action :set_request_body_to_params
	include RecordManager

	def create_all
		@response = []
		params['skills'].each do |skill|
			@response << create_record('skill', skill)
		end
		send_response
	end

	private
end
