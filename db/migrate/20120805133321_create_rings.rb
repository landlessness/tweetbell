class CreateRings < ActiveRecord::Migration
  def self.up
    create_table :rings do |t|
      t.string :twitter_user_id
      t.datetime :tweet_created_at
      t.string :tweet_id
      t.string :tweet_text
      t.string :lat
      t.string :lng
      t.timestamps
    end
  end

  def self.down
    drop_table :rings
  end
end
