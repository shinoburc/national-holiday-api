module Api
  module V1
    class HolidaysController < ApplicationController
      # GET /holidays/list/2013-01-01/2013-12-31.json
      # GET /holidays/list/2013-01-01/2013-12-31.xml
      def list
        Timeliness.default_timezone = :current
        start_date = Timeliness.parse(params[:start], :date)
        end_date = Timeliness.parse(params[:end], :date)

        if !start_date.nil? and !end_date.nil? and start_date <= end_date
          @holidays = Holiday.find(:all, :select => "name, date", :conditions => ["date between ? and ?", params[:start], params[:end]])
        else
          @holidays = []
        end
        respond_to do |format|
          format.json { render json: @holidays }
          format.xml  { render xml: @holidays }
          #format.caldat { render :layout => true }
          format.caldat { render :template => 'holidays/list' }
        end
      end

      # GET /holidays/is_holiday/2013-01-01.json
      # GET /holidays/is_holiday/2013-01-01.xml
      def is_holiday
        Timeliness.default_timezone = :current
        date = Timeliness.parse(params[:date], :date)

        logger.debug(date)

        if !date.nil? and Holiday.count(:conditions => ["date = ?", date.to_date.to_s]) == 0
          result = false
        else
          result = true
        end

        respond_to do |format|
          format.json { render json: result }
          format.xml  { render xml: result }
        end
      end
    end
  end
end
