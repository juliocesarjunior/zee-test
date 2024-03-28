############### ADMIN ###############
puts "CADASTRANDO ADMIN..."
User.create!(
  name: 'Admin',
  email: "admin@admin.com",
  password: '1234567890',
  status: 0
)
puts "ADMIN CADASTRADO COM SUCESSO!"