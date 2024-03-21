class Product < ApplicationRecord
	after_save :create_slug

	has_many :skus, dependent: :destroy

	enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active
	
	# def destroy
	# 	self.update_attribute(:status, 2)
	# end
	
	private
	def create_slug
		if self.name_internal.blank? or self.name_internal.nil?
			self.name_internal = ("#{self.name_display rescue '-'}-#{self.id.to_s rescue '-'}").parameterize
			self.save
		end
	end
end
