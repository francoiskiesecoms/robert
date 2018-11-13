class Student < ApplicationRecord


  validates :name, uniquess: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validates :address, presence: true

  # mount_uploader :photo, PhotoUploader
#
  belongs_to :user
  has_many :favorite_facilities, dependent: :destroy
  has_many :availibilities, dependent: :destroy
  has_many :missions, dependent: :destroy

end
