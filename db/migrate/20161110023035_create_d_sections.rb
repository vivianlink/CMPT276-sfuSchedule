class CreateDSections < ActiveRecord::Migration
  def change
    create_table :d_sections do |t|
      t.string :dSectionNumber

      t.timestamps null: false
    end
  end
end
