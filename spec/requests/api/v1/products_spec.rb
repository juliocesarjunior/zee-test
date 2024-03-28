require 'swagger_helper'
require 'factory_bot_rails'

#rails rswag:specs:swaggerize

RSpec.describe 'api/v1/products', type: :request do

    path '/produtos' do

        get('list products') do
            parameter name: :'q[name_display_or_description_cont]', in: :query, type: :string, description: 'Busca por Produtos (nome ou descrição)'
            parameter name: :'q[skus_code_cont]', in: :query, type: :string, description: 'Busca por Código(SKUs)'

            tags "Products"
            produces 'application/json'

            security [Bearer: {}]

            response(200, 'successful') do

                # FORMATO SCHEMA ESPERADO
                let(:schema) { products_schema }

                run_test!
            end
        end

        post('create products') do
            tags "products"
            consumes 'application/json'
            produces 'application/json'

            security [Bearer: {}]

            parameter RequestProductHelpers.product_params_parameter

            response(201, 'successful') do

                # FORMATO SCHEMA ESPERADO
                let(:schema) { product_schema }

                #EXEMPLO PARA APARECER
                examples RequestProductHelpers.product_example

                run_test!
            end
        end
    end

    path '/produtos/{id}' do

        parameter RequestProductHelpers.id_parameter
        
        get('show products') do
            tags "products"
            produces 'application/json'

            security [Bearer: {}]

            response(200, 'successful') do
                let(:id) { 1 }

                # FORMATO SCHEMA ESPERADO
                let(:schema) { product_schema }

                #EXEMPLO PARA APARECER
                examples RequestProductHelpers.product_example

                run_test!
            end
        end

        put('update products') do
            tags "products"
            consumes 'application/json'
            produces 'application/json'

            security [Bearer: {}]

            parameter RequestProductHelpers.id_parameter
            parameter RequestProductHelpers.product_update_params_parameter

            response(200, 'successful') do

                let(:id) { 1 }
                
                # FORMATO SCHEMA ESPERADO
                let(:schema) { product_schema }

                #EXEMPLO PARA APARECER
                examples RequestProductHelpers.product_update_example

                run_test!
            end
        end

        delete('delete products') do
            tags "products"
            produces 'application/json'

            security [Bearer: {}]

            response(204, 'successful') do
                let(:id) { 1 }
                run_test!
            end
        end

    end

end
