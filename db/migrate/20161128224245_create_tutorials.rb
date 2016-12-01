class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :tutname
      t.string :tutcalender
      t.string :tutlocation
      t.string :tutschedule

      t.timestamps null: false
    end
  end
end
