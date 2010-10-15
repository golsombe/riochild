class Teacher < ActiveRecord::Base
has_many :child_teachers
has_many :children, :through=> :child_teachers

def name
  "#{first} #{last}"
end

end
