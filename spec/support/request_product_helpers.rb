module RequestProductHelpers

    def self.products_example
        {
            'application/json' => {
                products: [
                    {
                        id: 1,
                        name_display: "Dodge Charger",
                        description: "Carro",
                        manufacturer: "Lamborghini",
                        active: true,
                        skus:[ 
                            {
                                name: "Altis Hybrid 1.8 16V CVT",
                                stock: 5,
                                price_table: "250.000,00",
                                price_listing: "260.000,00"
                            }
                        ],
                        created_at: "2024-01-18T13:58:28.282-03:00",
                        updated_at: "2024-01-18T13:58:28.282-03:00"
                    },
                    {
                        id: 2,
                        name_display: "Super Mario",
                        description: "Jogo",
                        manufacturer: "Nintendo",
                        active: true,
                        skus:[ 
                            {
                                name: "Altis Hybrid 1.8 16V CVT",
                                stock: 5,
                                price_table: "250.000,00",
                                price_listing: "260.000,00"
                            }
                        ],
                        created_at: "2024-01-18T13:58:28.282-03:00",
                        updated_at: "2024-01-18T13:58:28.282-03:00"
                    },
                ],
                meta: {
                    current_page: 1,
                    next_page: 2,
                    prev_page: nil,
                    total_pages: 2,
                    total_count: 20
                }
            }
        }
    end

    def self.product_example
        {
            'application/json' => {
                products: {
                    id: 1,
                    name_display: "Dodge Charger",
                    description: "Carro",
                    manufacturer: "Lamborghini",
                    active: true,
                    skus:[ 
                        {
                            name: "Altis Hybrid 1.8 16V CVT",
                            stock: 5,
                            price_table: "250.000,00",
                            price_listing: "260.000,00"
                        }
                    ],
                    created_at: "2024-01-18T13:58:28.282-03:00",
                    updated_at: "2024-01-18T13:58:28.282-03:00"
                }
            }
        }
    end

    def self.products_schema
        {
            type: :object,
            properties: {
                products: {
                    type: :array,
                    items: {
                        type: :object,
                        properties: {
                            id: { type: :integer },
                            name_display: { type: :string },
                            description: { type: :string },
                            manufacturer: { type: :string },
                            active: { type: :boolean },
                            skus:[ 
                                {
                                    type: :object,
                                    properties: {
                                        name: { type: :string },
                                        stock: { type: :integer },
                                        price_table: { type: :string },
                                        price_listing: { type: :string },
                                    }
                                }
                            ],

                            created_at: { type: :string },
                            updated_at: { type: :string }
                        }
                    }
                },
                meta: {
                    type: :object,
                    properties: {
                        current_page: { type: :integer },
                        next_page: { type: :integer },
                        prev_page: { type: :integer },
                        total_pages: { type: :integer },
                        total_count: { type: :integer }
                    }
                }
            }
        }
    end

    def self.product_schema
      {
        type: :object,
        properties: {
          example: {
            type: :object,
            properties: {
              id: { type: :integer },
              name_display: { type: :string },
              description: { type: :string },
              manufacturer: { type: :string },
              active: { type: :boolean },
              skus: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    stock: { type: :integer },
                    price_table: { type: :string },
                    price_listing: { type: :string }
                  },
                  required: [:name, :stock, :price_table, :price_listing]
                }
              },
              created_at: { type: :string },
              updated_at: { type: :string }
            },
            required: [:id, :name_display, :description, :manufacturer, :active, :skus, :created_at, :updated_at]
          }
        }
      }
    end


    def self.id_parameter
        {
            name: :id,
            in: :path,
            type: :integer,
            required: true,
            description: 'Product ID'
        }
    end

    def self.product_params_parameter(overrides = {})
      {
        name: :product_params,
        in: :body,
        schema: {
          type: :object,
          properties: {
            product: {
              type: :object,
              properties: {
                name_display: { type: :string, default: 'Produto 1' },
                description: { type: :string, default: 'Descrição 1' },
                manufacturer: { type: :string, default: 'Livro' },
                active: { type: :boolean, default: false }, # Alterei de 'false' para false
                skus: {
                  type: :array,
                  items: {
                    type: :object,
                    properties: {
                      name: { type: :string, default: 'Sku 1' },
                      stock: { type: :integer, default: 10 },
                      price_table: { type: :string, default: '10,00' },
                      price_listing: { type: :string, default: '9,00' }
                    },
                    required: [:name, :stock, :price_table, :price_listing]
                  }
                }
              },
              required: [:name_display] # Alterei de [:name] para [:name_display]
            }
          }
        }.merge(overrides)
      }
    end
end
