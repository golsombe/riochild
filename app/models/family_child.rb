class FamilyChild < ActiveRecord::Base
	belongs_to :family
	belongs_to :child
end
