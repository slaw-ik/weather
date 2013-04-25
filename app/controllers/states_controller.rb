class StatesController < ApplicationController
  def index
    @states = MnState.all
  end
end
