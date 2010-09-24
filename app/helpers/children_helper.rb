module ChildrenHelper

def child_primary_photo_column(record)
<<<<<<< HEAD
	begin
		@primary = record.child_images.find(:all, :conditions=> "photograph_primary=1")
		@primary_id = @primary[0][:id].to_s
		@cur_rec = record.id.to_s
		#'Primary Photo ' + @primary_id
		image_tag ('/system/photographs/'+ @primary_id +'/thumbnail/' + @primary[0][:photograph_file_name])
	rescue
		nil
	end
=======
		#@primary = Child.find(id).child_images.find(:all, :conditions=>"photograph_primary=1")
	@primary = record.child_images.find(:all, :conditions=> "photograph_primary=1")
	@primary_id = @primary[0][:id].to_s
	@cur_rec = record.id.to_s
	#'Primary Photo ' + @primary_id
	image_tag ('/system/photographs/'+ @primary_id +'/thumbnail/' + @primary[0][:photograph_file_name]) #rescue nil
>>>>>>> 39de118c5f619fc25dec498bc0591c8d60a31233
end

def child_name_column(record)
	record.first + ' ' + record.last rescue nil
end


end
