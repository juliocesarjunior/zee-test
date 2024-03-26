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
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Creation' do
    it 'creates a product' do
      expect { create(:product) }.to change(Product, :count).by(1)
    end

    it 'does not create product without name_display' do
      should validate_presence_of(:name_display)
    end
  end

  describe 'Associations' do
    it { should have_many(:skus).dependent(:destroy) }
    it { should accept_nested_attributes_for(:skus).allow_destroy(true) }
  end

  describe 'Callbacks' do
    it 'builds default SKU after initialization' do
      product = build(:product)
      expect(product.skus.count).to eq(1) # Assuming you always build a default SKU
    end

    it 'creates slug after saving if name_internal is blank' do
      product = create(:product, name_display: 'Test Product')
      expect(product.name_internal).to eq('test-product-1') # Assuming the ID is 1
    end
  end
end
