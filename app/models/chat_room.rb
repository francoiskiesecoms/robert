class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :facility
  belongs_to :student
end


