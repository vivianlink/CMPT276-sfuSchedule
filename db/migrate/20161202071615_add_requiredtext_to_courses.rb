class AddRequiredtextToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :requiredtext, :string
  end
end
