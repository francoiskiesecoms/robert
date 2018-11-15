class Availability < ApplicationRecord
  belongs_to :student


  def schedule
    " #{start_date.strftime("%^A %d/%m/%Y")}  to #{end_date.strftime("%^A %d/%m/%Y")} \n "
  end
end
