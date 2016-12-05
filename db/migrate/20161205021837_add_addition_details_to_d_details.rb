class AddAdditionDetailsToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :additionDetails, :string
  end
end
