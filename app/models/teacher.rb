class Teacher < ActiveRecord::Base
has_many :child_teachers
has_many :children, :through=> :child_teachers
has_attached_file :teach_photo, :default_style=>:large, :styles => { :thumbnail=> "100x80" , :large=> "640x480"}

def name
  "#{first} #{last}"
end

end
