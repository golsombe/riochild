module ChildrenHelper

def child_primary_photo_column(record)
                                #@primary = Child.find(id).child_images.find(:all, :conditions=>"photograph_primary=1")
                @primary = record.child_images.find(:all, :conditions=> "photograph_primary=1")
                @cur_rec = ChildImage.find(:first, :conditions=> ['photograph_primary=? and child_id=?',1,record.id]).id.to_s
                image_tag ('/system/photographs/'+ @cur_rec +'/thumbnail/' + @primary[0][:photograph_file_name]) rescue nil
end
end
