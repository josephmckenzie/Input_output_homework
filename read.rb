def read_write
file = File.open("sample.txt", "r")
contents = file.read
#I can choose to print it to the screen or just the file not sure what you want so ill put it in and just comment it so u know its there 
#puts contents   
filename = "sample2.txt"
somefile = File.open(filename, "w")
somefile.puts contents
somefile.close

end

read_write