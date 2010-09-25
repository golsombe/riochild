class ChildImagesController < ApplicationController
active_scaffold :child_image do |config|
		config.columns = [:photograph, :photograph_primary, :child]
		config.update.columns=[:photograph,:photograph_primary,:child]
		config.create.link.label = 'New Image'
		config.create.multipart = true
		config.update.multipart = true
		config.columns[:photograph].set_link 'show_image'
		config.columns[:photograph].link.popup = true
		config.label = 'Images'
	end

def show_image
	@record = ChildImage.find(:first,:conditions=> ['id=?',params[:id]])
end

def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end

end
