require 'twitter'

class Tweet < ActiveRecord::Base
  validates :id, uniqueness: true

  def self.pull_tweets
    client.search("Беларусь", since_id: maximum("id"), result_type: "recent").each do |tweet|
      unless older_than_one_day? tweet
        create!(
          id: tweet.id,
          created: tweet.created_at
        )
      else
        break
      end
    end
  end

  def self.count_on(start, ending)
    where(created: Time.at(start)..Time.at(ending)).count
  end

  private
  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key =  'KL2EdRnAlJP4BcktXNjuG0jgB'
      config.consumer_secret = 'iW0nq0Q3QuKDEX9tP12c1YDXhHVUyYgqadDueV3QDmCp5yNdcw'
      config.access_token = '3368976346-rAejnOmt5o4O81GisKTHG1FgaeJouOX8tniRUcO'
      config.access_token_secret = 'DOhoYzzaPv9ga42Mc6lq9KkS7m7VXhu1rXNbIcSpzbu2S'
    end
  end
end

def older_than_one_day?(tweet)
    diff = DateTime.now - DateTime.parse(tweet.created_at.to_s)
    diff.to_i > 1
end