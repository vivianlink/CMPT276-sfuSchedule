class WelcomeController < ApplicationController

	def index

		@sortedCourses = Course.order(viewCount: :desc)
		
		@nonEmptyView = Array.new
		
		@sortedCourses.each do |course|
			if course.viewCount
				@nonEmptyView.push(course)
			end
		end 
		

		@sortedbyCart = Course.order(cartCount: :desc)
		@nonEmptyCart = Array.new
		@sortedbyCart.each do |course|
			if course.cartCount
				@nonEmptyCart.push(course)
			end
		end 
	
	end


end
