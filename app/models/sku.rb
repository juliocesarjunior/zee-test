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
class Sku < ApplicationRecord
	belongs_to :product
	before_create :generate_ean13

	validates :name, :price_table, :price_listing, presence: true
	validates :code, uniqueness: true
	validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
	
	private

	def generate_ean13
		code = rand.to_s[2..13] 
		while !Sku.find_by(code: code).nil?
			code = rand.to_s[2..13] 
		end
		self.code = code
	end
end
