class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :mn_forecasts do |t|
      t.datetime :f_date
      t.integer :weather_id
      t.string :description
      t.integer :morning_low_temp
      t.integer :daytime_high_temp
      t.integer :prec_day
      t.string :prec_night

      t.timestamps
    end
  end
end
