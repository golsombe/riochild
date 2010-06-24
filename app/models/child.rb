class Child < ActiveRecord::Base
	has_many :family_children
	has_many :families, :through=> :family_children
	has_many :child_images
	has_many :child_updates
	def name
		"#{first} #{last}"
	end

	def sponsored
		if Date.today >= sponsor_being and Date.today <= sponsor_expire then true else false end
	end

end



