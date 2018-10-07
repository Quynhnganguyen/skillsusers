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

	def report_by_sql
		@reports =  ActiveRecord::Base.connection.execute("SELECT p.id, p.name, SUM(c.points) points, SUM(c.users_count) users_count FROM skills p \n
		 INNER JOIN (SELECT skills.id, skills.parent_id parent_id, SUM(users.points) points, COUNT(users.id) users_count \n
		 FROM skills INNER JOIN skills_users ON skills.id = skills_users.skill_id INNER JOIN users ON skills_users.user_id = users.id GROUP BY skills.id) c ON p.id = c.parent_id OR p.id = c.id \n
		 WHERE p.parent_id IS NULL GROUP BY p.id ORDER BY p.id")
		render "skills/show_report"
	end

	def report_without_sql
		@reports = Skill.where(parent_id: nil).map{|p| 
			{
				"id" => p.id, 
				"name"  =>  p.name, 
				"points"  =>  p.points, 
				"users_count"  =>  p.users_count
			}
		}
		render "skills/show_report"
	end
	private
end
