class Ring < ActiveRecord::Base
  attr_accessible :twitter_user_id, :tweet_created_at, :tweet_id, :tweet_text, :lat, :lng
end
