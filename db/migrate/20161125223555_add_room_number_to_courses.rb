class AddRoomNumberToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :RoomNumber, :string
  end
end
