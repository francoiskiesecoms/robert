class StudentsController < ApplicationController

  def favorite_missions
    @student = Student.find_by(user_id: current_user.id)
    @missions = @student.acceptable_missions
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

  def dashboard
    @student = Student.find_by(user_id: current_user.id)

     if @student.completed_missions.empty?
      @first_chart_array = [['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]]
      @first_chart_array_2019 = [['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]]
    else
      @student.completed_missions.each do |mission|
        if mission.end_time.year == 2018
        @first_chart_array = @student.search_and_add_completed(mission.end_time.strftime('%B'), 2018)
        else
        @first_chart_array_2019 = @student.search_and_add_completed(mission.end_time.strftime('%B'), 2019)
        end
      end
    end
    @student.upcoming_missions.each do |mission|
      if mission.end_time.year == 2018
       @second_chart_array = @student.search_and_add_upcoming(mission.end_time.strftime('%B'), 2018)
      else
       @second_chart_array_2019 = @student.search_and_add_upcoming(mission.end_time.strftime('%B'), 2019)
      end
    end
  end

  def profile
    @student = Student.find_by(user_id: current_user.id)
  end

  def training
    @student = Student.find_by(user_id: current_user.id)
  end

  def update
    @student = Student.find_by(user_id: current_user.id)
    @student.update(student_params)

    if @student.save
      redirect_to profile_path
    else
      render :profile
    end
  end

  def availabilities
    @availability = Availability.new
  end

  def revenues
    @student = Student.find_by(user_id: current_user.id)

    if @student.completed_missions.empty?
      @first_chart_array = [['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]]
      @first_chart_array_2019 = [['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]]
    else
      @student.completed_missions.each do |mission|
        if mission.end_time.year == 2018
        @first_chart_array = @student.search_and_add_completed(mission.end_time.strftime('%B'), 2018)
        else
        @first_chart_array_2019 = @student.search_and_add_completed(mission.end_time.strftime('%B'), 2019)
        end
      end
    end
    @student.upcoming_missions.each do |mission|
      if mission.end_time.year == 2018
       @second_chart_array = @student.search_and_add_upcoming(mission.end_time.strftime('%B'), 2018)
      else
       @second_chart_array_2019 = @student.search_and_add_upcoming(mission.end_time.strftime('%B'), 2019)
      end
    end
    @sum_2018 = @student.sum_revenu(@first_chart_array)
    @sum_2019 = @student.sum_revenu(@first_chart_array_2019)
  end

  def reviews
    @student = Student.find_by(user_id: current_user.id)
  end

  def chat
    @student = Student.find_by(user_id: current_user.id)
  end

  private

  def student_params
    params.require(:student).permit(:name, :address, :date_of_birth, :studies, :school, :phone_number, :photo, :email, :motivation, :user_id)
  end

end
