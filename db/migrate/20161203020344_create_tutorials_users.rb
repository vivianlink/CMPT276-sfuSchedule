class CreateTutorialsUsers < ActiveRecord::Migration
  def change
    create_table :tutorials_users do |t|
      t.integer :tutorial_id
      t.integer :user_id
    end
  end
end
