class AddAdditionDetailsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :additionDetails, :string
  end
end
