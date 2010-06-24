class ChildImagesController < ApplicationController
active_scaffold :child_image do |config|
		config.columns = [:child,:photograph, :photograph_primary]
		config.columns[:photograph].form_ui = :paperclip
		config.update.link = false
		config.search.link = false
		config.delete.link = false
		config.show.link = false
		config.label = 'Images'
		config.columns[:photograph].set_link 'show_image'
		config.create.multipart = true
		config.update.multipart = true
	end
def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end

def show_image
	@record = ChildImage.find(:first, :conditions=> ['id=?',params[:id]])
end

end
