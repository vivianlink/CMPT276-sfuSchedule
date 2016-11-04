class CreateDFaculties < ActiveRecord::Migration
  def change
    create_table :d_faculties do |t|
      t.string :dSubject

      t.timestamps null: false
    end
  end
end
