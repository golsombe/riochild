class ChildrenController < ApplicationController
#before_filter :login_required

active_scaffold :child do |config|
	config.actions = [:nested, :create, :update, :list, :show, :field_search]
	config.field_search.columns = :first,:last,:gender, :village, :sponsor_code, :father, :mother,:birth_cert,:birthdate, :sponsor_begin, :sponsor_expire,:teachers
	config.columns = [:first, :last, :age, :sponsored]
	config.columns << :child_name
	config.columns << :genderfull
	config.columns << :sponsored
	config.columns[:child_name].sort_by :sql => 'last'
	config.columns[:child_name].search_sql = "CONCAT(first,' ',last)"
	config.columns[:genderfull].label = 'Gender'
	config.columns[:genderfull].sort_by :sql=> 'gender'
	config.columns[:sponsored].sort_by :method => 'sponsored'
	config.columns[:teachers].search_ui = :multi_select
	config.columns[:teachers].collapsed = true
	config.columns[:birth_cert].search_ui = :checkbox
	config.list.columns =[:child_primary_photo, :child_name, :age, :genderfull,:village, :teachers, :grade, :sponsored]
#	config.show.columns = [:child_primary_photo, :child_name,:gender, :village, :teachers,:sponsor_code, :father, :mother, :lives_with,:academic, :attendance, :does_homework, :favorite_season,:age, :grade, :sisters, :brothers, :sponsored, :birth_cert, :sponsor_begin, :sponsor_expire,:occupation, :helps_with, :activities, :favorite_bibleverse,:bday]
	config.show.columns = [:child_primary_photo, :child_name,:gender, :village, :teachers,:sponsor_code, :father, :mother, :lives_with,:academic, :attendance, :does_homework, :favorite_season,:age, :grade, :sisters, :brothers, :sponsored, :birth_cert, :sponsor_begin, :sponsor_expire,:bday]

	config.create.columns = [:teachers,:first, :last ,:gender, :village,:sponsor_code, :father, :mother, :lives_with,:academic, :attendance, :does_homework, :favorite_season,:birthdate, :age, :grade, :sisters, :brothers, :birth_cert, :sponsor_begin, :sponsor_expire]
config.update.columns = [:teachers,:first, :last ,:gender, :village,:sponsor_code, :father, :mother, :lives_with,:academic, :attendance, :does_homework, :favorite_season,:birthdate, :age, :grade, :sisters, :brothers, :birth_cert, :sponsor_begin, :sponsor_expire]
	config.show.columns.add_subgroup 'Additional Fields' do |subgroup|
		subgroup.add :occupation, :helps_with, :activities, :favorite_bibleverse
		subgroup.collapsed = true
	end

	config.create.columns.add_subgroup 'Additional Fields' do |subgroup|
		subgroup.add :occupation, :helps_with, :activities, :favorite_bibleverse
		subgroup.collapsed = true
	end

	config.update.columns.add_subgroup 'Additional Fields' do |subgroup|
		subgroup.add :occupation, :helps_with, :activities, :favorite_bibleverse
		subgroup.collapsed = true
	end
	config.nested.add_link("Updates", [:child_updates])
	config.nested.add_link("Images", [:child_images])
	config.nested.add_link("Teacher", [:child_teachers])
	config.columns[:sponsor_begin].form_ui = :calendar_date_select
	config.columns[:sponsor_begin].label = 'Sponsorship Began'
	config.columns[:teachers].clear_link
	config.columns[:child_name].label = 'Name'

	config.columns[:occupation].form_ui = :text_editor
	config.columns[:occupation].options={:rows=> 3, :cols=>70}
	config.columns[:helps_with].form_ui = :text_editor
	config.columns[:helps_with].options={:rows=> 3, :cols=>70}
	config.columns[:activities].form_ui = :text_editor
	config.columns[:activities].options={:rows=> 3, :cols=>70}
	config.columns[:favorite_bibleverse].form_ui = :text_editor
	config.columns[:favorite_bibleverse].options={:rows=> 3, :cols=>70}


end #active_scaffold

def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end #conditions for collection

def avail_children
	@record = Child.find(:all, :conditions=> ['? not between sponsor_begin and sponsor_expire or sponsor_begin is null and child_images.photograph_primary = 1',Date.today],:select=>[:first,:last,:age,:created_at, :child_primary_photo],:include=> :child_images)
	@rec = Child.find_by_sql('SELECT c.first,c.last,c.age,c.created_at, i.photograph_file_name FROM children c LEFT join child_images i ON i.child_id = c.id and photograph_primary = 1 where ' + Date.today.to_s + ' not between sponsor_begin and sponsor_expire or sponsor_begin is null')
	respond_to do |format|
		format.html
		format.xml
		#format.json render :partial=> "children/avail_children.json"
		format.json {render :json => @rec}

#, :template=>'children/avail_children.builder.json'}
    end
end #avail_children
	
def sponsored
	@table = Child.report_table(:all, :only=> ["first","last", "age","teacher","village","gender"], :conditions=> ["sponsor_begin >= ?","2010-06-01"])
	@table.rename_columns {|c| c.to_s.camelize}
	respond_to do |format|
		format.html 
	end
	#send_data table.to_pdf, :content_type=> "application/pdf", :filename=> "Sponsored.pdf"
end #sponsored

end #class

