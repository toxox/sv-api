class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :video_id, null: false

      t.timestamps
    end
    add_index :rooms, :video_id, unique: true
  end
end
