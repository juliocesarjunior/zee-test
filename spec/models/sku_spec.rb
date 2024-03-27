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
require 'rails_helper'

RSpec.describe Sku, type: :model do
  let(:sku) { FactoryBot.build(:sku) }

  context 'Should validate' do
    it 'with name, sku type and size present' do
      expect(sku).to be_valid
    end

    it 'when product is not present' do
      sku.product_id = nil
      expect(sku).to be_valid
    end
  end

  context 'Should not be valid' do
    it 'when name is not present' do
      sku.name = nil
      expect(sku).not_to be_valid
    end

    it 'when price listing is not present' do
      sku.price_listing = nil
      expect(sku).not_to be_valid
    end

    it 'when price table is not present' do
      sku.price_table = nil
      expect(sku).not_to be_valid
    end

    it 'when stock is not present' do
      sku.stock = nil
      expect(sku).not_to be_valid
    end
  end

end
