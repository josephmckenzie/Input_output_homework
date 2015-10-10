def read_file_and_output
    file_old = File.open("input_isbn_file.csv","r")
    file_name = "isbn_output_test.csv"
    file_new = File.open(file_name, "w")
    file_old.each do |line|valid_isbn?(line)
        if @output == true
          file_new.puts line.chomp + ",valid"
        else @output == false
          file_new.puts line.chomp + ",invalid"
                    end
        end
    
    file_new.close

end

def valid_isbn?(any_string)
  no_dashes_or_spaces = remove_dashes_and_spaces_from_isbn(any_string)
  if no_dashes_or_spaces.length == 10
    check_digit_contains_X(no_dashes_or_spaces)
    if test_for_non_numeric_characters(no_dashes_or_spaces) == false
      @output = false
    else
  valid_isbn_10?(no_dashes_or_spaces) == true
    end
  
  else no_dashes_or_spaces.length == 13
    	check_digit_contains_X(no_dashes_or_spaces)
		if test_for_non_numeric_characters(no_dashes_or_spaces) == false
     
	 @output = false
    else
    valid_isbn_13?(no_dashes_or_spaces)
    end


  end
 
end


def valid_isbn_10?(no_dashes_or_spaces)
    no_dashes_or_spaces = no_dashes_or_spaces.split ""

array =[]

    no_dashes_or_spaces.each do |value|
    array << value.to_i 
    end
    

sum = 0

    array.each.with_index do |value, index|
    break if index == 9
    sum += value * (index + 1)
    end

check_digit = sum % 11

    if check_digit == array[9]
     @output = true
    else
     @output =false
    end
    
end

def valid_isbn_13?(no_dashes_or_spaces)
no_dashes_or_spaces = no_dashes_or_spaces.split(//)
 
 array =[]
 
   no_dashes_or_spaces.each do |value|
   array << value.to_i
   end
 
 sum = 0
 check_digit = 0
 
   array.each_with_index do |value,index|
     break if index == 12
         if index  %2 == 0
           sum += value * 1
          else
           sum += value * 3
         end
 end
       sum = sum %10
   check_digit=(10-sum)

    if check_digit == 10
       check_digit = 0
     end

     if array[12] == check_digit
      @output = true
     else
      @output = false
     end
        
 end


def remove_dashes_and_spaces_from_isbn(isbn_number)
    disallowed_characters = [ " ", "-"]
    
    disallowed_characters.each do |c|
      isbn_number.delete! c if isbn_number.include? c
    end
    isbn_number
end

def verify_length(isbn_number)
  isbn_number.length == 10 || isbn_number.length == 13
end

def check_digit_contains_X(no_dashes_or_spaces)
   no_dashes_or_spaces = no_dashes_or_spaces.split("")
  if no_dashes_or_spaces[9] == "x" || no_dashes_or_spaces[9] == "X"
  no_dashes_or_spaces[9] = 10
  end
    if no_dashes_or_spaces[9] == 10
	true
     else
     false
    end
  
end

def test_for_non_numeric_characters(no_dashes_or_spaces)
   only_digits = no_dashes_or_spaces

  if  only_digits =~ /\D/      #match any character that is not a digit
	false
  else
    true
  end

end



read_file_and_output
