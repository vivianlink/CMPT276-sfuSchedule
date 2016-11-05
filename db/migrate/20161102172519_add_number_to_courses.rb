class AddNumberToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :number, :string
  end
end
