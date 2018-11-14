class StudentsController < ApplicationController

  def favorite_missions
    @student = Student.find_by(user_id: current_user.id)
    @favorite_missions = @student.favorite_missions
    @missions = @favorite_missions.select{|fav_mission| fav_mission.pending && fav_mission.start_time > Time.now}
    @fit = Fit.new
  end

  def upcoming_missions
    @student = Student.find_by(user_id: current_user.id)
    @missions = @student.upcoming_missions
  end

  def completed_missions
    @student = Student.find_by(user_id: current_user.id)
    @missions = @student.completed_missions
  end

  def dashboard_summary

  end

  def profile

  end

  def update

  end

  def revenues

  end

  def reviews

  end

  def availibilities

  end

end
