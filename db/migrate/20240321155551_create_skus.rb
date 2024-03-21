class CreateSkus < ActiveRecord::Migration[7.0]
  def change
    create_table :skus do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :code
      t.text :stock
      t.string :price_table
      t.string :price_listing
      t.timestamps
    end
  end
end
