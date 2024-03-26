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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
