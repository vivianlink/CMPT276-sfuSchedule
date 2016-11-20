class CoursesController < ApplicationController

 helper_method :sort_column, :sort_direction
  
    #

	def index
      #@courses = Course.all
      @courses = Course.order(sort_column + " " + sort_direction)
      #for search
      @courses = Course.search(params[:faculty], params[:number],params[:year], 
        params[:semester],  params[:unit],  params[:designation] )


       # params[:section], params[:instructor], params[:unit], 
       # params[:designation])
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

    if @course.update_attributes(course_params) 
       redirect_to @course
    else
        render 'edit'
    end
  end


  def create
   # @faculty = Faculty.find(params[:faculty_id])
    #@course = Course.create(course_params)
    #redirect_to courses_path
    #render plain: params[:article].inspect
      @course = Course.new(course_params)
 
      if @course.save
        redirect_to courses_path
      else
        render 'new'
      end
  end


  def destroy
    #@faculty = Faculty.find(params[:faculty_id])
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:name, :year, 
        :semester, :faculty, :number, :section, :instructor, :schedule, :description, :unit, :CourseUrl)
    end


  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : "name"
   end
  
   def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end

end
