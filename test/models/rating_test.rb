require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end   test "test username	with invalid vaule" do

    test "test prof for legitimate name" do
		r=Rating.new('comment'=>'good prof, awesome!', 'rating'=> 9 , 
					'prof_name'=>'Mary', 'user_name'=>'vivian')
		assert  r.valid?, "All good"

		r.prof_name = 'asdfghjk sdfghjk sdfghjk sdfghj sdfghj sdfghj'
		assert_not  r.valid?, "Professor name can have maximum of 30 letters"

		r.prof_name = 'hi'
		assert_not  r.valid?, "Professor name can't be too short, minimum 3 letters"

	end 

	test "test for legitimate user name" do
		r1=Rating.new('comment'=>'good prof, awesome!', 'rating'=> 9, 
					'prof_name'=>'Mary', 'user_name'=>'vi')
		assert_not  r1.valid?, "the user_name is too short, need min 3 characters"

		r1.user_name = 'asdfghjkl sdfghjk sdfghjk sdfghjk s'
		assert_not  r1.valid?, "user_name is too long, max 20 characters"
		
	end

	test "rating must only be numeric" do
		r2=Rating.new('comment'=>'good prof, awesome!', 'rating'=>'testest', 
					'prof_name'=>'Mary', 'user_name'=>'viv')
		assert_not  r2.valid?, "rating need to be integer"

		r2.rating = 0.88
		assert_not  r2.valid?, "rating must be integer"

		r2.rating = ''
		assert r2.valid?, "empty rating should work"

		r2.rating = 5
		assert  r2.valid?, "integer is valid" 
	end

end
