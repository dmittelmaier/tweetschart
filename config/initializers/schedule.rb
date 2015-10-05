require 'rufus/scheduler'


scheduler = Rufus::Scheduler.new

scheduler.every '15s', first_in: '0.001s' do
  Tweet.pull_tweets
end