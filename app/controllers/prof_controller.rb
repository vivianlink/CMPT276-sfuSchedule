class ProfController < ApplicationController
  	def index
	  	@profs = Course.search("",
	        "","","", "", params[:prof_name], "", "")

	  	# get unique instructor names
	  	@profs = @profs.uniq.pluck(:instructor) 
	  	
	  	# sort
	  	@profs = @profs.sort! 
	end

	def list
	  	@profs = Course.search("",
	        "","","", "", params[:prof_name], "", "")

	  	# get unique instructor names
	  	@profs = @profs.uniq.pluck(:instructor) 
	  	
	  	# sort
	  	@profs = @profs.sort! 
	end

	def show
		@ratings = Rating.all
	end

	def new
		@rating = Rating.new
		@rating[:comment] = params[:comment]
		@rating[:rating] = params[:rating]
		@rating[:prof_name] = params[:prof_name]
		@rating[:user_name] = session[:user_name]

		@rating.save

		render "show"
	end
end
