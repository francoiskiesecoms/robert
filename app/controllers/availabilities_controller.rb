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

  private

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :student_id)
  end

  def convert_to(date_string)
    parsed = Date.strptime(date_string, "%m/%d/%Y")
  end

end



  # def update
  #   @grandparent = Grandparent.find(params[:id])
  #   @grandparent.update(grandparent_params)

  #   unless grandparent_params[:start_date].nil?
  #     @grandparent.start_date = convert_to(grandparent_params[:start_date])
  #   end

  #   unless grandparent_params[:end_date].nil?
  #     @grandparent.end_date = convert_to(grandparent_params[:end_date])
  #   end

  #   if @grandparent.save
  #     redirect_to profile_path(current_user)
  #   else
  #     render :edit
  #   end
  # end
