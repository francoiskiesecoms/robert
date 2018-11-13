class Facility < ApplicationRecord
  belongs_to :user


  validates :address, presence: true, uniqueness: true

  has_many :favorite_facilities
  has_many :seniors, dependent: :destroy
  has_many :missions, through: :seniors

end
