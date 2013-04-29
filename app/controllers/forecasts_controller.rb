class ForecastsController < ApplicationController

  def get_forecasts
    if params[:id]
      @forecasts = MnForecast.get_forecast(params[:id])
    end

    respond_to do |format|
      format.html {
        render :layout => false
      }
    end
  end
end
