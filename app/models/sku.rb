class Sku < ApplicationRecord
	belongs_to :product
	before_create :generate_ean13

	validates :name, presence: true
	validates :code, uniqueness: true
	validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :price_table, presence: true
	validates :price_listing, presence: true
	
	private

	def generate_ean13
		code = rand.to_s[2..13] 
		while !Sku.find_by(code: code).nil?
			code = rand.to_s[2..13] 
		end
		self.code = code
	end
end
