require 'csv'
require_relative "isbn.rb"

def read_from_isbn_file
	file_handle = File.open("input_isbn_file.csv", "r")
	file_name = "test_output.csv"
	file_variable = File.open(file_name, "w")
	file_handle.each do  |isbn_line|
		file_variable.puts isbn_line.chomp + "," + validate
	

	end

	file_variable.close

end



def  validate 
	["valid" , "invalid"].sample
		
	
	end

	
def print_valid_isbns_to_screen
	puts "the following isbn are valid" 
	CSV.foreach("test_output.csv") do |checked_isbns|
		if checked_isbns[1] == "valid"
		puts checked_isbns[0]
	end	
  end
end


read_from_isbn_file


print_valid_isbns_to_screen



