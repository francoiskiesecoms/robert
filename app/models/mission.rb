class Mission < ApplicationRecord
  belongs_to :senior
  validates :description, presence: true

def schedule
  "#{start_time.strftime("%^A %d/%m/%Y")} \n from #{start_time.strftime("%H:%M")} to #{end_time.strftime("%H:%M")}"
end

def payout
  price = 15
  return ((end_time - start_time)/(60*60)) * price
end

def average_rating
  if review_ponctuality.nil? || review_communication.nil? || review_satisfaction.nil?
    return nil
  else
    return (review_ponctuality + review_communication + review_satisfaction) / 3
  end
end

end
