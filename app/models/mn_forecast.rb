class MnForecast < ActiveRecord::Base
  attr_accessible :daytime_high_temp, :description, :f_date, :morning_low_temp, :prec_day, :prec_night, :weather_id
  belongs_to :state, :foreign_key => :state_id, :class_name => "MnState"
  belongs_to :weather, :foreign_key => :weather_id, :class_name => "MnWeather"

  def self.get_forecast(state_id)
    forecasts = self.where(:state_id => state_id)
    unless forecasts.empty?
      if forecasts.first.try(:updated_at).try(:utc) < DateTime.now.utc - 3.hours
        destroy_all(:state_id => state_id)
        forecasts = fetch_forecasts(state_id)
      end
    else
      forecasts = fetch_forecasts(state_id)
    end
    return forecasts
  end

  private

  def self.fetch_forecasts(state_id)

    state = MnState.find_by_id(state_id)

    client = Savon.client(wsdl: "http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
    response = client.call(:get_city_forecast_by_zip, message: {"ZIP" => "#{state.zip}"})
    forecasts = response.hash[:envelope][:body][:get_city_forecast_by_zip_response][:get_city_forecast_by_zip_result][:forecast_result][:forecast]

    result = []
    forecasts.each do |forecast|
      result << MnForecast.new(
          :f_date => forecast[:date],
          :description => forecast[:desciption],
          :morning_low_temp => forecast[:temperatures][:morning_low],
          :daytime_high_temp => forecast[:temperatures][:daytime_high],
          :prec_day => forecast[:probability_of_precipiation][:daytime],
          :prec_night => forecast[:probability_of_precipiation][:nighttime],
          :weather_id => forecast[:weather_id]
      )
    end

    state.forecasts << result
    return result
  end

end
