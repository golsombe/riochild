class Family < ActiveRecord::Base
	has_many :family_children
	has_many :children, :through=> :family_children
	has_many :family_images
	has_many :family_updates
end
