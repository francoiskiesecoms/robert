class FitsController < ApplicationController

  def create
    @fit = Fit.new
    @fit.student = Student.find_by(user_id: current_user.id)
    @fit.mission = Mission.find(params[:id])
    if @fit.save
      redirect_to dashboard_missions_path
    end
  end
end
