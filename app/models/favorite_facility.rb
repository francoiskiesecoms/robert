class FavoriteFacility < ApplicationRecord
  belongs_to :student
  belongs_to :facility
end
