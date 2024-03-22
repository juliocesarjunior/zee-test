class Sku < ApplicationRecord
	belongs_to :product
	before_create :generate_ean13

	validates :code, uniqueness: true

	private

	def generate_ean13
		code = rand.to_s[2..13] 
		while !Sku.find_by(code: code).nil?
			code = rand.to_s[2..13] 
		end
		self.code = code
	end
end
