class Doorman
  include GeoKit::Mappable
  
  def self.check
    Twitter.mentions.reverse.each do |mention|
      if mention.text =~ /ding\s*dong/i
        if mention.geo
          mention_location = Geokit::LatLng.normalize mention.geo.coordinates
          ribbon_farm_location = Geokit::LatLng.normalize [42.329481,-83.065838]
          if distance = mention_location.distance_to(ribbon_farm_location) < 0.25
            puts 'ding dong!'
          else
            puts 'too far away'
          end
        else
          puts 'no geo specified in tweet'
        end
        # TODO create a ring model to store the tweet id for each ring
        # use the last one to pass in as since_id for mentions method
        # pass tweet into Ring.create method
        # create method actual doe the ring
      else
        puts 'did not ding dong'
      end
    end
  end
end

  
