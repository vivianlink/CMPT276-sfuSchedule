class RemoveNameFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :name, :string
  end
end
