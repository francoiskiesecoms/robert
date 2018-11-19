class Facility < ApplicationRecord
  belongs_to :user
  # mount_uploader :photo, PhotoUploader

  # validates :address, presence: true, uniqueness: true

  has_many :favorite_facilities, dependent: :destroy
  has_many :seniors, dependent: :destroy
  has_many :missions, through: :seniors, dependent: :destroy
  has_many :chat_rooms
  has_many :messages, through: :chat_rooms

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
