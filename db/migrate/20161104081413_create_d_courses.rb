class CreateDCourses < ActiveRecord::Migration
  def change
    create_table :d_courses do |t|
      t.string :dCourseNumber
      t.string :dTitle

      t.timestamps null: false
    end
  end
end
