class Senior < ApplicationRecord
  belongs_to :facility
  has_many :missions
end
