class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|

      t.timestamps
      t.references :facility, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
