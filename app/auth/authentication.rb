class Authentication

    attr_reader :client
    
    def initialize(client_params, request)
        @client_params = client_params
        @client = self.find_client
    end

    def authenticate
        valid_client_password?
    end

    def generate_token
        JsonWebToken.encode({ client_id: @client.id, email: @client.email, expires_in: expiration_time })
    end

    private

    def valid_client_password?
        @client&.valid_password?(@client_params[:password])
    end

    def find_client
        Client.find_by(email: @client_params[:email], status: 0)
    end

    def expiration_time
        (Time.now + 60.days).to_i
    end
    
end