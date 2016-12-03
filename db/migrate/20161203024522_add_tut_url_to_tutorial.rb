class AddTutUrlToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :TutUrl, :string
  end
end
