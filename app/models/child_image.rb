class ChildImage < ActiveRecord::Base
	belongs_to :child
        has_attached_file :photograph, :default_style=>:large, :styles => { :thumbnail=> "100x80" , :large=> "640x480"}

def name
	"#{photograph_file_name}"
end
end
