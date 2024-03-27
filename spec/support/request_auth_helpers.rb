module RequestAuthHelpers

    def self.auth_example
        {
            'application/json' => {
                message: "Login efetuado com sucesso!",
                token: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6ImFkbWluQGFkbWluLmNvbSIsImV4cGlyZXNfaW4iOjE3MTY3MzUwMjd9.2hkpiKetoXcMPN10g2w24GT8DbzHThAhlx07qy9LXug",
                user: {
                    id: 1,
                    email: "admin@admin.com",
                    name: "admin",
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