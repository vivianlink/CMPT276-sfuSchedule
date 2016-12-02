class WelcomeController < ApplicationController

	class Prof
	   def initialize(name, rating, commentsCount)
	      @name=name
	      @rating=rating
	      @commentsCount=commentsCount
	   end

	   def commentsCount
	   		@commentsCount
	   end

	   def rating
	   		@rating
	   end

	   def name
	   		@name
	   end
	end

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

		@ratings = Rating.all

		@prof_names = @ratings.uniq.pluck(:prof_name) 

		@profs = Array.new

		@prof_names.each do |prof_name|
			@ratings = Rating.where(prof_name: prof_name)

			@ratings_total = 0
			@ratings_count = 0
			@comments_count = 0

			@ratings.each do |rating|
				if rating.rating
					@ratings_total += rating.rating
					@ratings_count += 1
				end

				if rating.comment != ""
					@comments_count += 1				
				end
			end

			@rating_average = @ratings_total.to_f / @ratings_count
			@rating_average = @rating_average.round(2)

			@profs.push(Prof.new(prof_name, @rating_average, @comments_count))
		end

		@profs_by_comments_count = @profs.sort_by { |prof| [ prof.commentsCount ] }.reverse!

		@profs_by_rating = @profs.clone

		# remove profs with no comments
		@profs_by_comments_count.delete_if do |prof|
			if prof.commentsCount == 0
				true
			else
				false
			end
		end

		# remove profs with NaN rating
		@profs_by_rating.delete_if do |prof|
			if prof.rating.nan?
				true
			else
				false
			end
		end

		@profs_by_rating = @profs_by_rating.sort_by { |prof| [ prof.rating ] }.reverse!
	end


end
