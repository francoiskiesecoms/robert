class Student < ApplicationRecord


  validates :name, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :favorite_facilities, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :missions
  has_many :fits
  has_many :chat_rooms
  has_many :messages, through: :chat_rooms


  def refused_missions
    refused_missions = []
    fits.all.each do |fit|
      refused_missions << fit.mission if fit.refused
    end
    refused_missions
  end

  def favorite_missions
    missions = []
    Mission.all.each do |mission|
      favorite_facilities.each do |fav_facility|
        if fav_facility.facility == mission.senior.facility
          missions << mission
        end
      end
    end

    missions.reject do |mission|
      refused_missions.include? mission
    end
  end

  #mission that are still pending, later than today, and for which we don't already have a mission

  def available_missions
    favorite_missions.select do |fav_mission|
      (fav_mission.pending) && (fav_mission.start_time > Time.now)
    end
  end

  def acceptable_missions
    acceptable_missions = []
    available_missions.each do |mission|
      availabilities.each do |availability|
        if (mission.start_time >= availability.start_date) && (mission.end_time <= availability.end_date) && (availability[mission.start_time.strftime("%A").downcase] == true)
          acceptable_missions << mission
        end
      end
    end
    acceptable_missions.uniq
  end

  def upcoming_missions
    missions = []
    fits.each do |fit|
      if (fit.mission.start_time > Time.now) && (fit.refused == false)
        missions << fit.mission
      end
    end
    missions
  end

  def completed_missions
    missions = []
    unless fits.nil?
      fits.each do |fit|
        if fit.mission.end_time <= Time.now && (fit.refused == false)
          missions << fit.mission
        end
      end
    end
    missions
  end


  def evaluation
    average = 0
    fits.each do |fit|
      average += (fit.mission.average_rating / fits.size)
    end
  average
  end

  def total_reviews
    count = 0
    fits.each do |fit|
      unless fit.mission.average_rating == 0
        count += 1
      end
    end
    return count
  end

  def top_reviews
    count = 0
    fits.each do |fit|
      count += 1 if fit.mission.review_ponctuality == 5
      count += 1 if fit.mission.review_satisfaction == 5
      count += 1 if fit.mission.review_communication == 5
    end
    return count
  end

  def working_days
    count = 0
    availabilities.each do |availability|
      count += ((availability.end_date - availability.start_date)/ 86400)
    end
    count.round(0)
  end

  def search_and_add_upcoming(month, year, array)
          array.each_with_index do |array2, i|
          if array2[0] == month
          revenue = 0
          upcoming_missions.each do |mission|
                if mission.end_time.year == year && mission.end_time.strftime('%B') == month
                  array[i] = [month, revenue += (mission.end_time.hour - mission.start_time.hour)*10]
                end
              end
            end
      end
      array
  end

  def search_and_add_completed(month, year, array)

      array.each_with_index do |array2, i|
            if array2[0] == month
              revenue = 0
                completed_missions.each do |mission|
                  p mission.end_time.strftime('%B') == month
                  if mission.end_time.year == year && mission.end_time.strftime('%B') == month
                    array[i] = [month, revenue += (mission.end_time.hour - mission.start_time.hour)*10]
                  end
                end
            end
      end
      array
  end

  def sum_revenu(array)
    total_revenu = []
    sum = 0
    unless array.nil?
      array.each do |element|
        total_revenu << element[1]
      end
      total_revenu.each do |e|
        sum += e
      end
    end
    sum
  end

    def revenue
    sum = 0
    unless fits == []
      fits.each do |fit|
        sum += fit.mission.payout
      end
    end
    sum
  end
end
