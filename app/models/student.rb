class Student < ApplicationRecord

  validates :name, uniquess: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader
end
