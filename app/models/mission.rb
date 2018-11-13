class Mission < ApplicationRecord
  belongs_to :senior

def schedule
  "#{start_time.strftime("%^A %d/%m/%Y")} \n from #{start_time.strftime("%H:%M")} to #{end_time.strftime("%H:%M")}"
end




  validates :description, presence: true
  validates :statut, presence: true

end
