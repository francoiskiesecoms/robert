class Senior < ApplicationRecord
  belongs_to :facility

  validates :name, uniqueness: true, presence: true
  validates :age, presence: true
end
