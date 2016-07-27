class AddRoomToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room, :string
  end
end
