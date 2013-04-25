class MnForecast < ActiveRecord::Base
  attr_accessible :daytime_high_temp, :description, :f_date, :morning_low_temp, :prec_day, :prec_night, :weather_id

  def self.get_forecast()
      client = Savon::Client.new("http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
      #response = client.request :web, :get_info_by_zip, body: { "USZip" => zip }
      #data = response.to_hash[:get_info_by_zip_response][:get_info_by_zip_result][:new_data_set][:table]
      #@state = data[:state]
      #@city = data[:city]
      #@area_code = data[:area_code]
      #@time_zone = data[:time_zone]

  end
end
