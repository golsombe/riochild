class ChildImagesController < ApplicationController
active_scaffold :child_image do |config|
<<<<<<< HEAD
		config.columns = [:photograph, :photograph_primary, :child]
		config.update.columns=[:photograph,:photograph_primary,:child]
		#config.show.link = true
		#config.update.link = true
		#config.search.link = false
		#config.delete.link = true
=======
		config.columns = [:photograph]
		config.update.columns=[:photograph,:photograph_primary]
		config.show.link = false
		config.update.link = false
		config.search.link = false
		config.delete.link = false
>>>>>>> 39de118c5f619fc25dec498bc0591c8d60a31233
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
