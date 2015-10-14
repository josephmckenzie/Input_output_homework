require"csv"

  def read_file_and_output
      file_old = File.open("input_isbn_file.csv","r")
      file_name = "isbn_output_test.csv"
      file_new = File.open(file_name, "w")
      file_old.each do |line|
		is_isbn_valid = valid_isbn?(line)
	  
          if is_isbn_valid == true
           file_new.puts line.chomp + ",valid"
          else 
		  file_new.puts line.chomp + ",invalid"
                      end
          end
    
      file_new.close

end


def valid_isbn?(any_string)
no_dashes_or_spaces = remove_disallowed_from_isbn(any_string)
	if no_dashes_or_spaces.length == 10
		no_dashes_or_spaces_array = no_dashes_or_spaces.split("")
		check_digit_x = change_check_digit(no_dashes_or_spaces_array)
		if test_for_numeric_characters(check_digit_x)== false
		 false
		else 
		valid_isbn_10?(check_digit_x) 
		end
	
	elsif no_dashes_or_spaces.length == 13
		no_dashes_or_spaces_array = no_dashes_or_spaces.split("")
	   if  test_for_numeric_characters(no_dashes_or_spaces_array)== false
	    false
	   else
		valid_isbn_13?(no_dashes_or_spaces_array)
		end
	else
		false	
		
	end
 
end

def valid_isbn_10?(isbn_array)
    array =[]
	isbn_array.each do |value|
    array << value.to_i 
    end
    

sum = 0

    array.each.with_index do |value, index|
    break if index == 9
    sum += value * (index + 1)
    end

check_digit = sum % 11

    if check_digit == array[9]
     true
    else
     false
    end
   
end



def remove_disallowed_from_isbn(any_string)
    disallowed_characters = [ " ", "-", "\n", "\""]
    
    disallowed_characters.each do | c|
      any_string.delete! c if any_string.include? c
    end
    any_string
end



def verify_length(no_dashes_or_spaces)
  no_dashes_or_spaces.length == 10 || no_dashes_or_spaces.length == 13
  
end

def valid_isbn_13?(array_13)

 
 array =[]
 
   array_13.each do |value|
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
     true
     else
      false
     end
       
 end

def change_check_digit(array)
	if array[9] == "x" || array[9] == "X"
	array[9] = "10"
	end
		 
	array
end

def test_for_numeric_characters(check_x)

  if check_x =~ /\D/
     false
  else
    true
  end
  
end
read_file_and_output