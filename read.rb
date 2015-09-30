# Function that makes our file and prints hello file to the file
 def make_file
 fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hello file!"
 somefile.close
end
 make_file


#  this function reads from the file we just made and then writes
 def read_write
file = File.open("input_isbn_file.csv", "r")
contents = file.read
 filename = "input_isbn_file_output.csv"
 somefile = File.open(filename, "w")
 somefile.puts contents
 somefile.close
 end

 read_write


#This will read fromone file and display that on the screen ask user for input and put that input in to a new file

def read_from_one_file_write_to_another
file = File.open("input_isbn_file.txt", "r")
contents = file.read
puts contents
choice=$stdin.gets.chomp  
filename = "input_isbn_file_output.txt"
somefile = File.open(filename, "w")
somefile.puts choice
somefile.close
end

read_from_one_file_write_to_another




