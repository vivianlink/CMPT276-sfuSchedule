class CreateDDetails < ActiveRecord::Migration
  def change
    create_table :d_details do |t|
      t.string :dProfessor

      t.timestamps null: false
    end
  end
end
