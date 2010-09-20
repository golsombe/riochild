class ChildrenController < ApplicationController
#before_filter :login_required

active_scaffold :child do |config|
	config.columns = [:first, :last, :age, :sponsored]
#:classroom, :sponsor_code,  :sponsor_begin, :sponsor_expire]
	config.list.columns =[:child_primary_photo, :child_name, :age, :gender,:village, :teacher, :grade, :classroom, :sponsored]
	config.show.columns =[:child_primary_photo, :child_name, :village, :classroom, :teacher, :grade, :age, :gender, :sponsor_begin, :sponsor_expire, :sponsored]
	config.create.columns = [:first, :last, :age, :father, :mother, :lives_with, :birthdate]
	config.update.columns = [:first, :last, :age, :father, :mother, :lives_with, :birthdate,:sponsor_begin, :sponsor_expire]
	config.nested.add_link("Updates", [:child_updates])
	config.nested.add_link("Images", [:child_images])
	config.nested.add_link("Teacher", [:child_teachers])
	config.columns[:sponsor_begin].form_ui = :calendar_date_select
	config.columns[:sponsor_begin].label = 'Sponsorship Began'
end #active_scaffold

def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end #conditions for collection

def avail_children
	@record = Child.find(:all, :conditions=> ['? not between sponsor_begin and sponsor_expire or sponsor_begin is null',Date.today])

	respond_to do |format|
		format.html
		format.xml { render :xml => @record.to_xml }
		format.json { render :json=> @record.to_json}
    end
end #avail_children
	
def sponsored
	@table = Child.report_table(:all, :only=> ["first","last", "age","classroom","teacher","village","gender"], :conditions=> ["sponsor_begin >= ?","2010-06-01"])
	@table.rename_columns {|c| c.to_s.camelize}
	respond_to do |format|
		format.html 
	end
	#send_data table.to_pdf, :content_type=> "application/pdf", :filename=> "Sponsored.pdf"
end #sponsored

end #class

