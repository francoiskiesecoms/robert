class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.timestamps
      t.references :fit, foreign_key: true
    end
  end
end


