class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :status, default: 0
      t.string :name_internal
      t.string :name_display
      t.text :description
      t.string :manufacturer
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
