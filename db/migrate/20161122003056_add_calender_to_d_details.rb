class AddCalenderToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :calender, :string
  end
end
