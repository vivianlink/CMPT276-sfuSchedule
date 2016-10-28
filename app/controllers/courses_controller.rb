class CoursesController < ApplicationController

	def index
      @courses = Course.all
  	end

	def show
    	@course = Course.find(params[:id])
  	end

  	def new
  		
  	end


  	def edit
     	@course = Course.find(params[:id])
  	end  


	def update
    	@course = Course.find(params[:id])

    	if @course.update(course_params)
     	 	redirect_to @course
    	else
      		render 'edit'
    	end
  	end


def create
      
     @faculty = Faculty.find(params[:faculty_id])
      @course = @faculty.courses.create(course_params)
      redirect_to faculty_path(@faculty)
  end


def destroy
     @faculty = Faculty.find(params[:faculty_id])
     @course = @faculty.courses.find(params[:id])
     @course.destroy
     redirect_to faculty_path(@faculty)
   end

  private
      def course_params
          params.require(:course).permit(:name)
      end

end
