require 'rubygems'
require 'config/environment.rb'
require 'fileutils'

children = Child.find(:all)
processed  = 'public/system/all_children/processed'

children.each do |child|
	ci = child.child_images.new()
	img = 'public/system/all_children/' + child.first.downcase + ' ' + child.middle.downcase + '.jpg'
	begin
			puts "Processing... "
			File.open(img,'rb') {|photo| ci.photograph = photo}
			ci.photograph_primary = 1
			ci.save
			FileUtils.mv(img,processed)
			puts img + " Moved... process complete."
	rescue
	end

	begin
		img = 'public/system/all_children/' + child.first.downcase + ' ' + child.last.downcase + '.jpg'
		puts "Processing..."
		File.open(img,'rb') {|photo| ci.photograph = photo}
		ci.photograph_primary = 1
		ci.save
		FileUtils.mv(img,processed)
		puts img + " Moved... process complete."
	rescue
	end

	begin
		img = 'public/system/all_children/' + child.first.downcase + ' ' + child.middle.downcase + ' ' + child.last.downcase + '.jpg'
		puts "Processing..."
		File.open(img,'rb') {|photo| ci.photograph = photo}
		ci.photograph_primary = 1
		ci.save
		FileUtils.mv(img,processed)
		puts img + " Moved... process complete."
	rescue
		puts "Could not find image for any combination of... " + [child.first, child.middle, child.last].join(' ') 
	end
end


