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
class ProductSerializer < BaseSerializer
  attributes :id,
  :name_internal, 
  :name_display,
  :description,
  :manufacturer,
  :active,
  :skus

  def skus
    object.skus.map do |sku|
      {
        id: sku.id,
        code: sku.code,
        name: sku.name,
        stock: sku.stock,
        price_table: sku.price_table,
        price_listing: sku.price_listing,
      }
    end
  end
end

