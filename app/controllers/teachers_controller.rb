class TeachersController < ApplicationController
 active_scaffold :Teachers do |config|
	config.columns = [:first, :last, :school, :grade]
	config.list.columns = [:photograph, :name, :school, :grade]
	config.show.columns = [:photograph, :first, :last, :gender, :village, :grade, :school]
	config.create.columns = [:photograph, :first, :last, :gender, :village, :grade, :school]
	config.update.columns = [:photograph, :first, :last, :gender, :village, :grade, :school]
	config.create.link.label = 'New Image'
	config.create.multipart = true
	config.update.multipart = true
	config.columns[:photograph].set_link 'show_image'
	config.columns[:photograph].link.popup = true
	config.label = 'Images'

end

end
