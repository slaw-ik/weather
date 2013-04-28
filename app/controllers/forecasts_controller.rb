class ForecastsController < ApplicationController

  def get_forecasts(state_id)
    @forecasts = MnForecast.get_forecast(state_id)
  end
end
