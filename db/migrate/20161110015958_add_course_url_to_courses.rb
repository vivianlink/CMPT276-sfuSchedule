class AddCourseUrlToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :CourseUrl, :string
  end
end
