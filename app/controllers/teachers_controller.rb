class TeachersController < ApplicationController
 active_scaffold :Teachers do |config|
	config.columns = [:first, :last, :school, :grade]
	config.columns << :teacher_name
	config.list.columns = [:teach_photo, :teacher_name, :school, :grade]
	config.show.columns = [:teach_photo, :teacher_name, :gender, :village, :grade, :school]
	config.create.columns = [:teach_photo, :first, :last, :gender, :village, :grade, :school]
	config.update.columns = [:teach_photo, :first, :last, :gender, :village, :grade, :school]
	config.create.multipart = true
	config.update.multipart = true
	config.columns[:teacher_name].sort_by :sql=> "last,first"
	config.columns[:teacher_name].search_sql = "CONCAT(first, ' ', last)" 
	config.columns[:teach_photo].set_link 'show_image'
	config.columns[:teach_photo].link.popup = true
end

end
