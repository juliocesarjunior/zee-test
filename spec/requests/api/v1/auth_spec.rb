require 'swagger_helper'
require 'factory_bot_rails'

RSpec.describe 'api/v1/auth', type: :request do

    path '/api/v1/auth/authenticate' do
        post('authenticate') do
            tags 'Authentication Client'
            consumes 'application/json'
            produces 'application/json'

            parameter name: 'email', in: :query, type: :string, description: 'Email', value: 'admin@admin.com'
            parameter name: 'password', in: :query, type: :string, description: 'Password', value: '1234567890'
            
            response(200, 'successful') do
                
                # FORMATO SCHEMA ESPERADO
                let(:schema) { auth_schema }

                #EXEMPLO PARA APARECER
                examples RequestAuthHelpers.auth_example

                run_test!
            end
        end
    end


end
