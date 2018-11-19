class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.timestamps
      t.string :title
      t.string :content
      t.references :chat_room, foreign_key: true
    end
  end
end
