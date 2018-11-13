class Student < ApplicationRecord
  belongs_to :user
  has_many :favorite_facilities
  has_many :availibilities
  has_many :missions
end
