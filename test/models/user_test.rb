require 'test_helper'

class UserTest < ActiveSupport::TestCase
   #test "the truth" do
    # assert true
   #end


    test "test username	with invalid vaule" do
		u=User.new('username'=>'papapapapapapapapapap', 'email'=>'qq@qq.com', 
					'password'=> '666666', 'password_confirmation'=>'666666')
		assert_not  u.valid?, "papapapapapapapapapap is more than 20 letters, it should not be a valid username"

		u.username = 'aa'
		assert_not  u.valid?, "aa is less than 3 letters, it should not be a valid username"

		u.username = 'jacky'
		u.save
		u1=User.new('username'=>'jacky', 'email'=>'qq@qq.com',
					 'password'=> '666666', 'password_confirmation'=>'666666')

		assert_not  u1.valid?, "jacky is already used, it should not be a valid"

	end


	test "test email with invalid vaule" do
		e=User.new('username'=>'jojo', 'email'=>'@.', 
					'password'=> '666666', 'password_confirmation'=>'666666')
		assert_not  e.valid?, "@. should not be a valid username"

		e.email = '@@'
		assert_not  e.valid?, "@@ should not be a valid username"
		
	end


	test "test password with invalid vaule" do
		w=User.new('username'=>'joe', 'email'=>'qq@qq.com', 
					'password'=> '666666', 'password_confirmation'=>'666667')
		assert_not  w.valid?, "the two passwords are identical, it should not be a valid username"

		w.password = '66666'
		w.password_confirmation = '66666'

		assert_not  w.valid?, "66666 is less than 6 characters, it should not be a valid username"

		w.password = '666666666666666666666'
		w.password_confirmation = '666666666666666666666'

		assert_not  w.valid?, "666666666666666666666 is more than 21 characters, it should not be a valid username"


	end

end
