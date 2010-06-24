class ChildrenController < ApplicationController
#before_filter :login_required

active_scaffold :child do |config|
		config.columns = [:first, :last, :age, :gender, :sponsor_being, :sponsor_expire, :village, :class_room, :teacher, :grade, :child_images, :child_updates]
		config.list.columns = [:child_primary_photo, :name, :age, :gender, :sponsored]
		config.show.columns = [:name,:age, :gender, :child_updates, :primary_photograph]
#		config.columns[:sponsor_being].form_ui = :calendar_date_select
#		config.columns[:sponsor_being].label = 'Sponsorship Began'
	end
def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end

end

