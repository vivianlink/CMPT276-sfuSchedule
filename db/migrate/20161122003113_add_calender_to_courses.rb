class AddCalenderToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :calender, :string
  end
end
