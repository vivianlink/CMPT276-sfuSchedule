class AddDUnitToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :dUnit, :string
  end
end
