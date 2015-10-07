def check_for_spaces_or_dashes(isbn)
#if includes a space then delete space
	if isbn.include? " "
	isbn.delete! ' '
#if includes a dash then delete dash	
	else isbn.include? "-"
	isbn.delete! '-'
	end
check_length_of_isbn(isbn)
isbn
end

def check_length_of_isbn(isbn)
#spits array in to indivual elements
@isbn_number = isbn.split ""
#counts elements and tells us the legnth of array
length = @isbn_number.count

if length
	 10
	check_digit_contains_X(@isbn_number)
		elsif only_numbers(@new_number) == true
		false
		else check_digit_10(@new_number)
		end
	if length 
	13
		check_digit_contains_X(@isbn_number)
		elsif only_numbers(@isbn_number) == true
		false
		else check_digit_13(@isbn_number)
		end
	else false
#detects the length and evualtes if it is true or false
length == 10 or length == 13 ? true : false	
end



def check_digit_contains_X(number)
#if lowercase or capt X then that x is equal to the number 10
	if number[9] == "x" || number[9] == "X"
	number[9] = "10"
	end

@new_number = number
end

def only_numbers(number)

isbn = number.join("")
#true if isbn only has digits in it 	
	true if isbn =~ /[[:digit:]]/

end

def check_digit_10(number)
array =[]

	number.each do |value|
	array << value.to_i end

sum = 0

	array.each.with_index do |value, index|
#breaks out of the loop if condition is true	
	break if index == 9
	sum += (value * (index + 1)) end

check_digit = sum%11
	
	if check_digit == array[9]
	true
	else false
	end
check_digit == array[9] ? true : false
end

def check_digit_13(number)
	
array =[]

	number.each do |value|
	array << value.to_i end
	
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
		
	if array[12] == check_digit
	true
	else false
	end
#checks the 12 index pos and returns true or false based on what it finds
	array[12] == check_digit ? true : false
end
