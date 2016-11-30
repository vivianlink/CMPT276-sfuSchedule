class AddCourseIdToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :course_id, :integer
  end
end
