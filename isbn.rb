def isbn_checker(isbn_number)
no_spaces_isbn = remove_spaces_from_isbn(isbn_number)
no_dashes_isbn = remove_dashes_from_isbn(no_spaces_isbn)
if verify_length(no_dashes_isbn) == true 
isbn_array=isbn_number_array(isbn_number)
check_digit_contains_X(isbn_number)
check_digit_10_is_valid(isbn_array)
check_digit_valid_13(isbn_number)
else 
false
end
end





#this function verifies if the length of the isbn is a correct length of either 10 or 13

def verify_length(isbn_number)
  if isbn_number.length==10
    true
  elsif isbn_number.length==13
  true
  else
    false
  end
end

#function for removing dashes from the isbn number 
def remove_dashes_from_isbn(isbn_number)
  if isbn_number.include?"-"
	 isbn_number.delete!"-"
	 
else isbn_number
	  end
	  end
  
#function for removing spaces from isbn number
def remove_spaces_from_isbn(isbn_number)
  if isbn_number.include?" "
     isbn_number.delete!" " 
	 else isbn_number	
	end
	end
	
#splits the array up into indivual elements 
def isbn_number_array(isbn_number)

	isbn_number_array=isbn_number.split(//,)
	end

#checks to see if the isbn has a x in it or not 	
def check_digit_contains_X(isbn_number)
isbn_number = isbn_number.split(//,)

	if isbn_number[9] == "x" or isbn_number[9] == "X"
	isbn_number[9] = 10
	end
	
isbn_number[9] == 10

end

#function to check for correct check digit	
def check_digit_10_is_valid(isbn)
array =[]


	isbn.each do |value|
	array << value.to_i 
	end
	

sum = 0

	array.each.with_index do |value, index|
	break if index == 9
	sum += value * (index + 1)
	end

check_digit = sum%11

		
if check_digit == array[9]
	true
	else
	false
	end

check_digit == array[9]
end

#Checks for valid check digit
def check_digit_valid_13(isbn)
array =[]
isbn = isbn.split("")
	isbn.each do |value|
	array << value.to_i 
	end
	
sum = 0
check_digit = 0
	
        array.each_with_index do |value, index|
            break if index == 12
			if index % 2 == 0
            sum += value * 1
            else
            sum += value * 3
			end 
			end
	sum = sum % 10
    check_digit = (10 - sum)
	
		if check_digit == 10
		check_digit = 0
		end
		

array[12] == check_digit
end

