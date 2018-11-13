class Mission < ApplicationRecord
  belongs_to :senior
  belongs_to :student

  validates :description, presence: true
  validates :statut, presence: true
end
