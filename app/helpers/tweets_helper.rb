module TweetsHelper
	def tweets_chart_series
    (@start_time..DateTime.now.to_i).step(@step).each_cons(2).map do |period| 
      Tweet.count_on(period[0], period[1]) 
    end
    .to_a
  end
end
