class HolidaysController < ApplicationController
  # GET /holidays
  # GET /holidays.json
  # GET /holidays.xml
  def index
    if params[:date].present? and params[:date][:year_condition].present?
      year_condition = params[:date][:year_condition]
      @holidays = Holiday.where("date between ? and ?", year_condition + "-01-01", year_condition + "-12-31").order("date ASC").page params[:page]
    else
      @holidays = Holiday.page params[:page]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holidays }
      format.xml  { render xml: @holidays }
    end
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @holiday }
    end
  end
end
