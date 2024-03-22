class Product < ApplicationRecord
	after_save :create_slug
	after_initialize :build_default_archive

	has_many :skus
	accepts_nested_attributes_for :skus, allow_destroy: true

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

	private
	def build_default_archive
		skus.build if skus.empty?
	end
	def create_slug
		if self.name_internal.blank? or self.name_internal.nil?
			self.name_internal = ("#{self.name_display rescue '-'}-#{self.id.to_s rescue '-'}").parameterize
			self.save
		end
	end
end
