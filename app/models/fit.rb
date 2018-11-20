class Fit < ApplicationRecord
  belongs_to :student
  belongs_to :mission
  has_many :chat_rooms

end
