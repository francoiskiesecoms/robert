class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  def from?(some_user)
  user == some_user
  end


  def shortened
    string = ""
    split = content.split(" ")
    counter = 0
    while counter < 5
      string << (split[counter] + " ") unless split[counter].nil?
      counter += 1
    end
    string +"..."
  end
end
