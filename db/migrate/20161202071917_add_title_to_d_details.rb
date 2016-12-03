class AddTitleToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :title, :string
  end
end
