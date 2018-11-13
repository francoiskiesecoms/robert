class Student < ApplicationRecord


  validates :name, uniquess: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validates :address, presence: true

  # mount_uploader :photo, PhotoUploader
#
  belongs_to :user
  has_many :favorite_facilities, dependent: :destroy
  has_many :availibilities, dependent: :destroy
  has_many :missions, dependent: :destroy

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
