# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(FALSE)
#  description   :text
#  manufacturer  :string
#  name_display  :string
#  name_internal :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :product do
    name_display { Faker::Vehicle.make_and_model }
    name_internal { name_display.parameterize }
    description { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    manufacturer { Faker::Vehicle.manufacture }
    active { Faker::Boolean.boolean }

    # Adicionando a criação do SKU associado ao Product
    after(:create) do |product|
      create(:sku, product: product)
    end
  end
end

