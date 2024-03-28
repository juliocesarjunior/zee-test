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
	before_save :update_name_internal, if: :name_display_changed?

	#after_initialize :build_default_sku

	has_many :skus
	accepts_nested_attributes_for :skus, allow_destroy: true
	
	validates :name_display, presence: true

	private

	def build_default_sku
		skus.build if skus.empty?
	end

	def update_name_internal
		self.name_internal = generate_slug(name_display)
	end

	def generate_slug(name)
		name.parameterize
	end
end
