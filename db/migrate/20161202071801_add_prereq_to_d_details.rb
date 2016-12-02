class AddPrereqToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :prereq, :string
  end
end
