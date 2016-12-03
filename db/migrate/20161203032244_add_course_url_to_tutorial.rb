class AddCourseUrlToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :CourseUrl, :string
  end
end
