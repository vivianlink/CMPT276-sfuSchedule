class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :rating
      t.string :prof_name
      t.string :user_name

      t.timestamps null: false
    end
  end
end
