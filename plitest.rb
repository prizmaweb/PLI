attribute_array = CSV.read(ARGV[0])
attribute_array.flatten!
attribute_pli_map=Hash.new
#read the pli excel
pli_arr_of_arrs = CSV.read(ARGV[1])

#for each attribute value
attribute_array.each { |attribute|
	pli_list=attribute_pli_map[attribute] || []
	
	#find all plis where ctc contains the attribute value
	pli_arr_of_arrs.each {  |row|
		pli_id=row[0]
		pli_ctc=row[1]
		if pli_ctc.include?  attribute
			pli_list.push(pli_id)
		end
	}
	attribute_pli_map.store(attribute,pli_list)	
}
attribute_pli_map	
	
