class FacilitiesController < ApplicationController
  def index

    @user_student = Student.find_by(user_id: current_user.id)
    @facility_chose = []
    @facilities = Facility.all
    if @user_student.favorite_facilities
      @user_student.favorite_facilities.each do |fav|
            @facility_chose << fav.facility_id
      end
    end

    if params[:query].present?
      @facilities = Facility.search_by_address(params[:query])
    else
      @facilities = Facility.all
    end

    @facilities = Facility.where.not(latitude: nil, longitude: nil)
    @markers = @facilities.map do |facility|
      {
        lng: facility.longitude,
        lat: facility.latitude,
        infoWindow: { content: render_to_string(partial: "/facilities/partial", locals: { facility: facility }) }
      }
    end
  end

  def click_facility
    @facility = Facility.find params[:facility]
    FavoriteFacility.create(student: Student.find_by(user_id: current_user.id), facility:@facility)
    respond_to  do |format|
       format.js
    end
  end

  def click_remove
    @facility = Facility.find params[:facility]
    FavoriteFacility.find_by(student: Student.find_by(user_id: current_user.id), facility:@facility).destroy
    respond_to  do |format|
       format.js
    end
  end
end
