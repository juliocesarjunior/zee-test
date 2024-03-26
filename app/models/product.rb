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
class Product < ApplicationRecord
	after_save :create_slug
	after_initialize :build_default_sku

	has_many :skus
	accepts_nested_attributes_for :skus, allow_destroy: true
	
	validates :name_display, presence: true

	private
	def build_default_sku
		skus.build if skus.empty?
	end
	def create_slug
		if self.name_internal.blank? or self.name_internal.nil?
			self.name_internal = ("#{self.name_display rescue '-'}-#{self.id.to_s rescue '-'}").parameterize
			self.save
		end
	end
end
