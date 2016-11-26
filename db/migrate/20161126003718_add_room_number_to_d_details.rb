class AddRoomNumberToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :RoomNumber, :string
  end
end
