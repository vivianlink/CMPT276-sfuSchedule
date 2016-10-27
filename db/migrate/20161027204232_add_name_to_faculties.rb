class AddNameToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :name, :string
  end
end
