class FamilyImage < ActiveRecord::Base
	belongs_to :family
        has_attached_file :img, :styles => { :thumbnail => "100x80",:large=> "640x480" }
end
