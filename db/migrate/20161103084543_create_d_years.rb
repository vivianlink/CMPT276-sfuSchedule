class CreateDYears < ActiveRecord::Migration
  def change
    create_table :d_years do |t|
      t.string :dYearNumber

      t.timestamps null: false
    end
  end
end
