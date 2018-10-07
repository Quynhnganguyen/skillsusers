module RecordManager
	private
	def create_record table_name, properties=[]
		permitted = init_params properties

		message = "Action is not executed"
		begin
			instance_variable_set("@"+"#{table_name}", table_name.classify.camelize.constantize.new)
	      	instance_variable_get("@"+"#{table_name}").update_attributes(permitted.to_h)
	      	instance_variable_get("@"+"#{table_name}").save!
	      	message = {"message"=> "successful"}
		rescue => e
			message = {
				"message"=> "unsuccessful", 
				"error"=> "#{e.to_s}"
			}
	      	if instance_variable_get("@"+"#{table_name}")
	      		message["error_extra"] = "#{instance_variable_get("@"+"#{table_name}").errors.messages}"
	      	end
		end
	end
	private
	def init_params properties
		properties.permit!
	end
end