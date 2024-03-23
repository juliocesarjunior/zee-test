module Api
    module V1
        class AuthController < ApiController
            before_action :authorization_request, except: [:authenticate]

            def authenticate
               auth = Authentication.new(login_params, request)
               if auth.authenticate
                    render json: {
                        message: 'Login efetuado com sucesso!',
                        token: auth.generate_token,
                        user: auth.user
                    }, status: :ok
                else
                    render json: {
                        message: 'E-mail ou senha incorreta'
                    }, status: :unauthorized
                end
                
                rescue StandardError => e
                    render json: {
                        message: 'E-mail ou senha não encontrados'
                    }, status: :not_found
            end

            private
            def login_params
                params.permit(:email, :password)
            end

        end

    end
end