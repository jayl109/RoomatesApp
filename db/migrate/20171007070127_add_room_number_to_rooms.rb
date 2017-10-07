class AddRoomNumberToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :room_number, :integer
  end
end
