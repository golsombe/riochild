class ChildrenController < ApplicationController
#before_filter :login_required

active_scaffold :child do |config|
		config.columns = [:first, :last, :age, :gender, :sponsor_being, :sponsor_expire, :child_images, :child_updates]
		config.list.columns = [:name, :age, :gender, :sponsored]
		config.columns[:sponsor_being].form_ui = :calendar_date_select
		config.columns[:sponsor_being].label = 'Sponsorship Began'
		#~ config.columns[:trn_dt].form_ui = :calendar_date_select
		#~ config.columns[:trn_dt].options = {:size=> 15,:embedded => :true, :month_year => "label", :year_range => [0.years.ago, 3.years.from_now]}
		#~ config.columns[:trn_dt].label = "Date"
		#~ config.columns[:amt].label= "Amount"
		#~ config.columns[:amt].options = {:size=> 15, :format=> :currency}
		
		#~ config.columns[:note].form_ui = :textarea
		#~ config.columns[:note].options = {:cols=>60, :rows=> 5}
	end
def conditions_for_collection
	#~ "user_id = #{current_user.id}"
end

end

