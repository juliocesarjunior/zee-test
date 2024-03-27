FactoryBot.define do
  factory :sku do
    name { Faker::Vehicle.version }
    code { Faker::Number.number(digits: 12) }
    price_listing { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    price_table { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    stock { Faker::Number.between(from: 1, to: 100) }
    product
  end
end
