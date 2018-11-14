class Mission < ApplicationRecord
  belongs_to :senior
  validates :description, presence: true

def schedule
  "#{start_time.strftime("%^A %d/%m/%Y")} \n from #{start_time.strftime("%H:%M")} to #{end_time.strftime("%H:%M")}"
end



end
