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
  context 'Creation' do
    it "creates a sku" do
      expect { create(:sku) }.to change(Sku, :count).by(1)
    end

    it "does not create sku without required attributes" do
      expect { create(:sku, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price_listing) }
    it { is_expected.to validate_presence_of(:price_table) }
    it { is_expected.to validate_presence_of(:stock) }
  end
end
