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
require "test_helper"

class SkuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
