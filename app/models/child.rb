class Child < ActiveRecord::Base
	acts_as_reportable

	has_many :family_children
	has_many :child_teachers
	has_many :teachers, :through=> :child_teachers
	has_many :families, :through=> :family_children
	has_many :child_images
	has_many :child_updates

	validates_presence_of     :first
        validates_presence_of     :last
	validates_inclusion_of 	   :gender, :in=> %w(M F), :message=> "Gender must be expressed as either M or F", :allow_nil=>true
        validates_numericality_of    :age,:allow_nil=> true
	validates_numericality_of    :grade, :allow_nil=> true


	def name
		"#{first} #{last}" rescue nil
	end
	
	def bday
		birthdate.strftime('%B %d, %Y') rescue nil
	end

	def sponsored
		if (sponsor_begin <= Date.today && sponsor_expire >= Date.today rescue false) or (sponsor_begin <= Date.today && sponsor_expire.nil? rescue false)  then 
			true
		else
			false
		end
	end
end

