# class Authorization
#   	def initialize(request)
#     	@token = request.headers[:Authorization]
#   	end

#   	def current_user
#     	@current_user ||= fetch_current_user if @token.present?
# 	rescue StandardError => e
#     	Rails.logger.error("Search user Error: #{e.message}")
#     	nil
#   	end

#   	private

#   	def fetch_current_user

#   		decodeToken = JsonWebToken.decode(@token)

#   		user_id = decodeToken[:user_id]

#   		user = User.find_by(id: user_id, status: 0)
    	
#     	user = user if user && decodeToken[:expires_in].to_i > Time.now.to_i 
    	
#     	user
#   	end
# end

class Authorization
  def initialize(request)
    @token = extract_token(request)
  end

  def current_user
    @current_user ||= fetch_current_user if @token.present?
  rescue StandardError => e
    Rails.logger.error("Search user Error: #{e.message}")
    nil
  end

  private

  def extract_token(request)
    authorization_header = request.headers['Authorization']
    return nil unless authorization_header.present?

    token_type, token = authorization_header.split(' ')
    return token if token_type == 'Bearer'

    nil
  end

  def fetch_current_user
    decodeToken = JsonWebToken.decode(@token)
    user_id = decodeToken[:user_id]
    user = User.find_by(id: user_id, status: 0)
    user if user && decodeToken[:expires_in].to_i > Time.now.to_i
  end
end