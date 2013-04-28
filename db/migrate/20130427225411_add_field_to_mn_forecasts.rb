class AddFieldToMnForecasts < ActiveRecord::Migration
  def change
    add_column :mn_forecasts, :state_id, :integer
  end
end
