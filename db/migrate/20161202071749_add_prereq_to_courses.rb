class AddPrereqToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :prereq, :string
  end
end
