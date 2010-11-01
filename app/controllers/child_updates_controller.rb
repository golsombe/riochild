class ChildUpdatesController < ApplicationController
active_scaffold :child_update do |config|
		config.columns = [:notes, :updated_at]
		config.search.link = false
		config.update.link = false
		config.delete.link = false
		config.show.link = false
		config.label = 'Updates'
		config.columns[:updated_at].label = "Updated"
		config.columns[:notes].options={:rows=>3, :cols=> 70}
		config.columns[:notes].form_ui = :text_editor
		config.create.link.label = 'New Update'
		config.columns[:notes].set_link 'show_note'
		config.columns[:notes].link.popup = true
	end
def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end
def show_note
	@record = ChildUpdate.find(:first, :conditions=> ['id=?',params[:id]])
end

end
