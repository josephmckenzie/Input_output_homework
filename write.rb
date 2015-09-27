filename = "sample.txt"
somefile = File.open(filename, "w")
somefile.puts "Hello file!"
somefile.close