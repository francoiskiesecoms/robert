class Student < ApplicationRecord
  belongs_to :user
  has_many :favorite_facilities
  has_many :availibilities
  has_many :fits

  def favorite_missions
  missions = []
  Mission.all.each do |mission|
    favorite_facilities.each do |fav_facility|
      if fav_facility.facility == mission.senior.facility
        missions << mission
      end
    end
  end
  missions
  end

  def upcoming_missions
    missions = []
    fits.each do |fit|

      if fit.mission.start_time > Time.now
        missions << fit.mission
      end
    end
    missions
  end

  def completed_missions
    missions = []
    fits.each do |fit|
      if fit.mission.end_time <= Time.now
        missions << fit.mission
      end
    end
    missions
  end

end
