class Authentication

    attr_reader :user
    
    def initialize(user_params, request)
        @user_params = user_params
        @user = self.find_user
    end

    def authenticate
        valid_user_password?
    end

    def generate_token
        JsonWebToken.encode({ user_id: @user.id, email: @user.email, expires_in: expiration_time })
    end

    private

    def valid_user_password?
        @user&.valid_password?(@user_params[:password])
    end

    def find_user
        User.find_by(email: @user_params[:email], status: 0)
    end

    def expiration_time
        (Time.now + 60.days).to_i
    end
    
end