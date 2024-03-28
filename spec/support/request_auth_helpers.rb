module RequestAuthHelpers

    def self.auth_example
        {
            'application/json' => {
                message: "Login efetuado com sucesso!",
                token: "token",
                user: {
                    id: nil,
                    email: "email",
                    name: "nome",
                    status: "active",
                    created_at: "2024-01-21T10:40:41.687-03:00",
                    updated_at: "2024-01-21T10:40:41.687-03:00"
                }
            }
        }
    end

    def self.auth_schema
        {
            type: :object,
            properties: {
               message: { type: :string },
               token: { type: :string },
               user: {
                    type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string },
                        email: { type: :string },
                        status: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string }
                    }
                },
            }
        }
    end
end