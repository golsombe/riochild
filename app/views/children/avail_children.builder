xml.instruct!
xml.children do
  @record.each do |child|
    xml.child do
      xml.first child.first
      xml.last child.last
      xml.age child.age
	cid = child.id.to_s rescue 0
	pi = child.child_images[0].id rescue 0
	nm = child.child_images[0].name rescue ''
      xml.photo_url  '/system/photographs/' + pi.to_s + '/thumbnail/' + nm
      xml.show_url '/children/' + cid + '?_method=get'
      xml.available_since child.created_at.strftime('%m/%d/%Y') rescue nil
    end
  end
end
