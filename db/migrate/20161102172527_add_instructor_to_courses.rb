class AddInstructorToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :instructor, :string
  end
end
