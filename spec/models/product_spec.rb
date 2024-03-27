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
  let(:product) { FactoryBot.build(:product) }
  let(:sku) { FactoryBot.build(:sku) }

  context 'Should validate' do
    it 'with  name display, description, manufacturer present' do
      expect(product).to be_valid
    end
  end

    it 'does not create product without name_display' do
      should validate_presence_of(:name_display)
    end

  context 'Should not be valid' do
    it 'when name is not present' do
      product.name_display = nil
      expect(product).not_to be_valid
    end

    # it 'when description is not present' do
    #   product.description = nil
    #   expect(product).not_to be_valid
    # end

    # it 'when manufacturer type is not present' do
    #   product.manufacturer = nil
    #   expect(product).not_to be_valid
    # end
  end

  describe 'Associations' do
    it { should accept_nested_attributes_for(:skus).allow_destroy(true) }
  end
end
