module TeachersHelper

def teacher_name_column(record)
	record.first + ' ' + record.last rescue nil
end
	
end
