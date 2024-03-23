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

