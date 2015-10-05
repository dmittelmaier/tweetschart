class TweetsController < ApplicationController
  def index
  	@start_time = 1.day.ago.to_i
    @step = 10.minutes
  end
end
