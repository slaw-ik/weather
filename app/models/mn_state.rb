class MnState < ActiveRecord::Base  
  attr_accessible :name, :zip
  has_many :forecasts, :foreign_key => :state_id, :class_name => "MnForecast"
end
