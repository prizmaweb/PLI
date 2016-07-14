require 'csv'
attr_array=Array.new
attr_array.push('GB')
attr_array.push('MPV')
index=Hash.new
arr_of_arrs = CSV.read("pli.csv")
arr_of_arrs.each { |row| 
      attr_array.each {  |attribute|
        if row[1].include?  attribute  
          stored_plis=index[attribute] || []
          stored_plis.push(row[0])
          index.store(attribute,stored_plis)      
        end
    } 
}
  puts index