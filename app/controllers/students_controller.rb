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

  end

  def reviews

  end

  private
  def student_params
    params.require(:student).permit(:name, :address, :date_of_birth, :studies, :school, :phone_number, :photo, :email, :motivation, :user_id)
  end

end
