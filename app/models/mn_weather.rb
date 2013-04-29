class MnWeather < ActiveRecord::Base
  attr_accessible :id,:description, :picture_url
  has_many :forecasts, :foreign_key => :wether_id, :class_name => "MnForecast"

  def self.fetch_weather
    client = Savon.client(wsdl: "http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
    response = client.call(:get_weather_information)
    weathers = response.hash[:envelope][:body][:get_weather_information_response][:get_weather_information_result][:weather_description]

    MnWeather.destroy_all
    weathers.each do |weather|
      MnWeather.create(
          :id => weather[:weather_id],
          :description => weather[:description],
          :picture_url => weather[:picture_url]
      )
    end
  end
end
