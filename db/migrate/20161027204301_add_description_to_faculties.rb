class AddDescriptionToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :description, :text
  end
end
