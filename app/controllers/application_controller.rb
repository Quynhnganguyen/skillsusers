class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    def plural_name
    	class_name = self.class.name
    	class_name.slice! "Controller"
    	return class_name.underscore
    end

    def single_name
    	plural.singularize
    end

    def model_name
    	single.classify.camelize
    end

	private
	def set_request_body_to_params
		body_data = request.body.read
		unless body_data.blank?
			json_data = JSON.parse(body_data)
			json_data.keys.each do |key|
				params[key] ||= json_data[key]
			end
		end
  	end

  	def send_response
    	if @response.to_s.include?"error"
      		@status = 500
    	else
      		@status = 200
    	end
    	respond_to do |format|
      		format.json { render :json => @response, status: @status }      
    	end
  	end

end
