class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all

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
end