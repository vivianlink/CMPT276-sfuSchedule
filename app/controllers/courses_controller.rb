class CoursesController < ApplicationController

helper_method :sort_column, :sort_direction

def sort


    if params[:commit] == "Search(in WQB order)"

      @courses = Course.search(params[:faculty], params[:number],params[:year],
                  params[:semester],  params[:unit],
                 params[:W],params[:Q],params[:B]).order(year: :desc,faculty: :asc, designation: :desc,
                  number: :asc, unit: :asc)#.order("#{sort_column} #{sort_direction}")

    elsif params[:commit] == "Search"
          @courses = Course.search(params[:faculty], params[:number],params[:year],
        params[:semester],  params[:unit],
          params[:W],params[:Q],params[:B] ).order(year: :desc,faculty: :asc, number: :asc, unit: :asc)
    end

  end

	def index
      @courses = Course.all

      #for search
      @courses = Course.order("#{sort_column} #{sort_direction}")

  	end

	def show
    @course = Course.find(params[:id])
    if @course.viewCount
      @course.viewCount = @course.viewCount + 1
    else
      @course.viewCount = 1
    end 

    @course.save
  end

  def new
  		@course = Course.new
  end


  def edit
     @course = Course.find(params[:id])
  end


	def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:notice] = 'Course was successfully updated.'
       redirect_to @course
    else
        render 'edit'
    end
  end


  def create
      @course = Course.new(course_params)

      if @course.save
        redirect_to courses_path
      else
        render 'new'
      end
  end

  def add
    @currUser = User.find(session[:user_id])
    @course = Course.find(params[:id])
    @course.user << @currUser

    if @course.cartCount
      @course.cartCount = @course.cartCount + 1
    else
      @course.cartCount = 1
    end 

    @course.save
    redirect_to :back
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
        :semester, :faculty, :number, :section, :instructor, :schedule, :description, :unit, :designation, :CourseUrl)
    end

  def sortable_columns
    ["faculty", "number","unit","designation","year","semester"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "faculty"
   end

   def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end

end
