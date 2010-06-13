class FamilyImage < ActiveRecord::Base
	belongs_to :family
        has_attached_file :img, :styles => { :large=> "800x600", :medium => "320x240>", :thumb => "100x80>" }
end
