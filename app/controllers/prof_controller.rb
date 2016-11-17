class ProfController < ApplicationController
  def index
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
  end
end
