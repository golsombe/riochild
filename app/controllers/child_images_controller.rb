class ChildImagesController < ApplicationController
active_scaffold :child_image do |config|
		config.columns = [:child,:photograph_thumb]
		config.create.multipart = true
		config.update.multipart = true
	end
def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end

end
