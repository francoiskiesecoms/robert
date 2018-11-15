class AvailabilitiesController < ApplicationController

  def create
    @student = Student.find_by(user_id: current_user.id)
    @availability = Availability.new
    @availability.start_date = convert_to(availability_params[:start_date])
    @availability.end_date = convert_to(availability_params[:end_date])
    @availability.student = @student
    @availability.save
    redirect_to calendar_path
  end

  def update
    @availability = Availability.find(availability_params[:availability_id])
    @availability.monday = convert_to_boolean(availability_params[:monday])
    @availability.tuesday = convert_to_boolean(availability_params[:tuesday])
    @availability.wednesday = convert_to_boolean(availability_params[:wednesday])
    @availability.thursday = convert_to_boolean(availability_params[:thursday])
    @availability.friday = convert_to_boolean(availability_params[:friday])
    @availability.saturday = convert_to_boolean(availability_params[:saturday])
    @availability.sunday = convert_to_boolean(availability_params[:sunday])
    if @availability.save
      redirect_to calendar_path
    end
  end

  def destroy
    Availability.find(params[:id]).destroy
    redirect_to calendar_path
  end

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :student_id, :monday, :tuesday, :wednesday, :thursday, :friday, :availability_id)
  end

  def convert_to(date_string)
    parsed = Date.strptime(date_string, "%m/%d/%Y")
  end

  def convert_to_boolean(binary)
    binary == "1"
  end

end

