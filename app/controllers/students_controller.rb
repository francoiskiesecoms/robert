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
    @missions_completed = @student.completed_missions
    @missions_upcoming = @student.upcoming_missions

    @first_chart_array = [
    ['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]
    ]
    @missions_completed.each do |mission|
      @first_chart_array = search_and_add_completed(@first_chart_array, mission.end_time.strftime('%B'))
    end


    @second_chart_array = [
        ['January', 0],['February', 0 ],['Mars',0],['April', 0],['May', 0],['June', 0],['Jully', 0],['August', 0],['September', 0],['October', 0],['November', 0],['December', 0 ]
    ]
    @missions_upcoming.each do |mission|
      @second_chart_array = search_and_add_upcoming(@second_chart_array, mission.end_time.strftime('%B'))
    end

    @total_revenu = []
    @sum = 0

    @first_chart_array.each do |element|
      @total_revenu << element[1]
    end
    @total_revenu.each do |e|
      @sum += e
    end
  end

  def reviews

  end


  private

  def search_and_add_upcoming(array, month)
      array.each_with_index do |array2, i|
            if array2[0] == month
              @student = Student.find_by(user_id: current_user.id)
              @missions_upcoming = @student.upcoming_missions
              @revenue = 0
                @missions_upcoming.each do |mission|
                  array[i] = [month, @revenue += (mission.end_time.hour - mission.start_time.hour)*10]
                end
            end
      end
      array
  end

  def search_and_add_completed(array, month)
      array.each_with_index do |array2, i|
            if array2[0] == month
              @student = Student.find_by(user_id: current_user.id)
              @missions_completed = @student.completed_missions
              @revenue = 0
                @missions_completed.each do |mission|
                  array[i] = [month, @revenue += (mission.end_time.hour - mission.start_time.hour)*10]
                end
            end
      end
      array
  end

  def student_params
    params.require(:student).permit(:name, :address, :date_of_birth, :studies, :school, :phone_number, :photo, :email, :motivation, :user_id)
  end

end
