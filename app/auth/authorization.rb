class Authorization
  	def initialize(request)
    	@token = request.headers[:Authorization]
  	end

  	def current_client
    	@current_client ||= fetch_current_client if @token.present?
	rescue StandardError => e
    	Rails.logger.error("Search Client Error: #{e.message}")
    	nil
  	end

  	private

  	def fetch_current_client

  		decodeToken = JsonWebToken.decode(@token)

  		client_id = decodeToken[:client_id]

  		client = Client.includes(:profile).find_by(id: client_id, status: 0)
    	
    	client = client if client && decodeToken[:expires_in].to_i > Time.now.to_i 
    	
    	client
  	end
end
