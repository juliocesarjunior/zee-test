# == Schema Information
#
# Table name: skus
#
#  id            :bigint           not null, primary key
#  code          :string
#  name          :string
#  price_listing :string
#  price_table   :string
#  stock         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :bigint           not null
#
# Indexes
#
#  index_skus_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :sku do
    name { Faker::Vehicle.version }
    code { Faker::Number.number(digits: 12) }
    price_listing { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    price_table { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    stock { Faker::Number.between(from: 1, to: 100) }
    association :product
  end
end

