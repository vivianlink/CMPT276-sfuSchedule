class AddDScheduleToDDetail < ActiveRecord::Migration
  def change
    add_column :d_details, :DSchedule, :string
  end
end
