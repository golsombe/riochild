class ChildImage < ActiveRecord::Base
	belongs_to :child
        has_attached_file :photograph_thumb, :default_style=>:large, :styles => { :thumbnail=> "100x80" , :medium=>"320x240", :large=> "640x480"}
 end
