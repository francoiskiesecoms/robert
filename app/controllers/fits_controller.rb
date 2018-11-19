class FitsController < ApplicationController

  def accept
    @fit = Fit.new
    @fit.student = Student.find_by(user_id: current_user.id)
    @fit.mission = Mission.find(params[:id])
    if @fit.save
      @fit.mission.pending = false
      @fit.mission.save
      respond_to do |format|
        format.html { redirect_to dashboard_missions_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
      format.html { redirect_to dashboard_missions_path }
      format.js  # <-- idem
      end
    end
  end

  def refuse
    @fit = Fit.new
    @fit.student = Student.find_by(user_id: current_user.id)
    @fit.mission = Mission.find(params[:id])
    @fit.refused = true
    if @fit.save
      redirect_to dashboard_missions_path
    end
  end

end
