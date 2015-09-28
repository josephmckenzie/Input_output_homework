#Function that makes our file and prints hello file to the file
# def make_file
# fname = "sample.txt"
# somefile = File.open(fname, "w")
# somefile.puts "Hello file!"
# somefile.close
# end
# make_file


#this function reads from the file we just made and then writes
def read_write
file = File.open("input_isbn_file.csv", "r")
contents = file.read
#I can choose to print it to the screen or just the file not sure what you want so ill put it in and just comment it so u know its there 
#puts contents   
filename = "input_isbn_file_output.csv"
somefile = File.open(filename, "w")
somefile.puts contents
somefile.close

end

read_write
