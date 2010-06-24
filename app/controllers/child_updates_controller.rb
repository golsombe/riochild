class ChildUpdatesController < ApplicationController
active_scaffold :child_update do |config|
		config.columns = [:notes, :updated_at]
		config.columns[:updated_at].form_ui = :calendar_date_select
		config.update.link = false
		config.show.link = false
		config.delete.link = false
		config.search.link = false
		config.columns[:notes].set_link 'show_note'
		config.columns[:notes].link.popup=true
		config.label = 'Updates'
	end
def show_note
	@record = ChildUpdate.find(:first, :conditions=> ['id=?',params[:id]])
end

end
