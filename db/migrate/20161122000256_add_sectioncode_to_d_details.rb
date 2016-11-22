class AddSectioncodeToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :sectioncode, :string
  end
end
