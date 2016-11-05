class FacultiesController < ApplicationController
	
	def index
      @faculties = Faculty.all
  	end

	def show
    	@faculty = Faculty.find(params[:id])
  	end

  	def new
  		
  	end


  	def edit
     	@faculty = Faculty.find(params[:id])
  	end  


	def update
    	@faculty = Faculty.find(params[:id])

    	if @faculty.update(faculty_params)
     	 	redirect_to @faculty
    	else
      		render 'edit'
    	end
  	end


	def create
  		@faculty = Faculty.new(faculty_params)
 
  		if @faculty.save
  			redirect_to @faculty
  		else
  			render 'new'
  		end
	end


	def destroy
  		@faculty = Faculty.find(params[:id])
  		@faculty.destroy
  		redirect_to faculties_path
	end

	private
    	def faculty_params
      		params.require(:faculty).permit(:name, :description)
    	end
end
