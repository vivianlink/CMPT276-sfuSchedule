class AddRequiredtextToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :requiredtext, :string
  end
end
