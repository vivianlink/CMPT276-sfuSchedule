class AddCoreqToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :coreq, :string
  end
end
