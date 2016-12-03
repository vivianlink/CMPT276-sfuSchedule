class AddCoursedetailsToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :coursedetails, :string
  end
end
