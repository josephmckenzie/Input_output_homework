require_relative "isbn.rb"
require "minitest/autorun"

class Isbn_test < Minitest::Test

	def test_to_remove_spaces_or_dashes
	assert_equal("0321146530", check_for_spaces_or_dashes("0-321-14653-0"))
	assert_equal("0321146530", check_for_spaces_or_dashes("0-21 14653-0"))
	end
	
	def test_for_valid_length_for_10_or_13
	assert_equal(true, check_length_of_isbn("0321146530"))
	assert_equal(false, check_length_of_isbn("03211046530"))
	assert_equal(true, check_length_of_isbn("9780470059029"))
	assert_equal(false, check_length_of_isbn("97804700059029"))
	end

	def test_for_check_digit_contains_x
	assert_equal(["0","8","0","4","4","2","9","5","7","10"], check_digit_contains_X(["0","8","0","4","4","2","9","5","7","x"]))
	assert_equal(["0","8","0","4","4","2","9","5","7","8"], check_digit_contains_X(["0","8","0","4","4","2","9","5","7","8"]))
	end
	
	
	def test_for_check_digit_10
	assert_equal(true, check_digit_10(["0","4","7","1","9","5","8","6","9","7"]))
	assert_equal(false, check_digit_10(["1","4","7","1","9","5","8","6","9","7"]))
	end
	
	def test_for_check_digit_13
    assert_equal(true, check_digit_13(["9","7","8","0","1","5","6","0","2","7","3","2","8"]))
    assert_equal(false, check_digit_13(["7","8","0","6","7","0","0","2","0","4","8","5"]))
    assert_equal(false, check_digit_13(["1","3","4","5","6","7","8","9","1","1","1","1"]))
	assert_equal(true, check_digit_13(["9","7","8","0","3","0","6","4","0","6","1","5","7"]))
	assert_equal(true, check_digit_13(["9","7","8","3","1","6","1","4","8","4","1","0","0"]))
    end 
	
end
