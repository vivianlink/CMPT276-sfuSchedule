class ProfController < ApplicationController
  	def index
		prof_name = params[:prof_name]
		if prof_name
			prof_name.downcase!
		end

		@profs = Course.where("LOWER(instructor) LIKE ?", "%#{prof_name}%")

	  	# get unique instructor names
	  	@profs = @profs.uniq.pluck(:instructor) 
	  	
	  	# sort
	  	@profs = @profs.sort! 
	end

	def list
		prof_name = params[:prof_name]
		if prof_name
			prof_name.downcase!
		end

		@profs = Course.where("LOWER(instructor) LIKE ?", "%#{prof_name}%")

	  	# get unique instructor names
	  	@profs = @profs.uniq.pluck(:instructor) 
	  	
	  	# sort
	  	@profs = @profs.sort! 
	end

	def show
		@ratings = Rating.where(prof_name: params[:prof_name])

		@ratings_total = 0
		@ratings_count = 0


		@ratings.each do |rating|
			print rating.rating
			if rating.rating
				@ratings_total += rating.rating
				@ratings_count += 1
			end
		end

		@rating_average = @ratings_total.to_f / @ratings_count
		@rating_average = @rating_average.round(2)
	end

	def new
		# delete previous comment for this prof from this user
		Rating.where(:prof_name => params[:prof_name], :user_name => session[:user_name]).destroy_all

		@rating = Rating.new
		@rating[:comment] = params[:comment]
		@rating[:rating] = params[:rating]
		@rating[:prof_name] = params[:prof_name]
		@rating[:user_name] = session[:user_name]

		@rating.save

		redirect_to action: "show", prof_name: params[:prof_name]
	end
end
