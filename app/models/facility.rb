class Facility < ApplicationRecord
  belongs_to :user

  validates :address, presence: true, uniqueness: true
end
