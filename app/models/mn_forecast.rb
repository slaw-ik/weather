class MnForecast < ActiveRecord::Base
  attr_accessible :daytime_high_temp, :description, :f_date, :morning_low_temp, :prec_day, :prec_night, :weather_id

  def self.get_forecast(state_id)
    @forecasts = self.where(:state_id => state_id)
    unless @forecasts.empty?
      if @forecasts.first.try(:updated_at) < DteTime.now - 3.hours
        @forecasts.destroy_all
        @forecasts = fetch_forecasts(state_id)
      end
    else
      @forecasts = fetch_forecasts(state_id)
    end

    #client = Savon.client(wsdl: "http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
    #response = client.call(:get_city_forecast_by_zip, message: { "ZIP" => "90001" })
    #forecast = response.hash[:envelope][:body][:get_city_forecast_by_zip_response][:get_city_forecast_by_zip_result][:forecast_result][:forecast]


    #{ :date=>Thu, 18 Apr 2013 00:00:00 +0000,
    #  :weather_id=>"4",
    #  :desciption=>"Sunny",
    #  :temperatures=>{
    #    :morning_low=>"53",
    #    :daytime_high=>"83"
    #  },
    #  :probability_of_precipiation=>{
    #    :nighttime=>"00",
    #    :daytime=>"00"
    #  }
    #}


  end

  private

  def self.fetch_forecasts(state_id)
     puts ("Fetching..." + state_id.to_s)
  end

end
