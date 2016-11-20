class AddUnitToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :Unit, :string
  end
end
