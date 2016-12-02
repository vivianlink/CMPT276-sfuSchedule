class AddCoreqToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :coreq, :string
  end
end
