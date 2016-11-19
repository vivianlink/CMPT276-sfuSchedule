class AddDesignationToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :designation, :string
  end
end
