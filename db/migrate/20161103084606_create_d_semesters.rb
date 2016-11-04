class CreateDSemesters < ActiveRecord::Migration
  def change
    create_table :d_semesters do |t|
      t.string :dSemesterSeasons

      t.timestamps null: false
    end
  end
end
