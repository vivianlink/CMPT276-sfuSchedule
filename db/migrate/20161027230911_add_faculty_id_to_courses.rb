class AddFacultyIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :faculty_id, :integer
  end
end
