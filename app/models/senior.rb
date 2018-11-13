class Senior < ApplicationRecord
  belongs_to :facility


  validates :name, uniqueness: true, presence: true
  validates :age, presence: true

  has_many :missions, dependent: :destroy

end
