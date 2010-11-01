require "paperclip" 
identify_path = %x[which identify].chomp('identify')
Paperclip.options[:command_path] = '/usr/local/bin/'
#Paperclip.options[:command_path] = identify_path
Paperclip.options[:swallow_stderr] = false