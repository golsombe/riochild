require 'rubygems'
require 'shoulda'
require 'test_helper'
class ChildrenControllerTest < ActionController::TestCase
    context "on GET to :show for first record" do
      setup do
        get :show, :id => 1
      end

      should_respond_with(:success)
      should_render_template('show')
      should_not_set_the_flash

    end
    context "on Get to :list records" do
	setup do
		get :list
	end
	
	should_respond_with(:success)
	should_render_template('list')
	should_not_set_the_flash

	#should_have_columns_in(:list,:child_primary_photo, :child_name, :age, :gender,:village, :teacher, :grade, :classroom, :sponsor_code,  :sponsor_begin, :sponsor_expire)
	#should_render_as_form_ui(:sponsor_begin, :calendar_date_select)
     end
     context "on Post to :create should create record" do
	setup do 
		Child.create(:first=> "one", :last=>"two")
	end
	
	should_change "Child.count", :by=> 1
	
     end

  end
