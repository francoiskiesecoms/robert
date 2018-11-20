class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

   def from?(some_user)

   end
end
