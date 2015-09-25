class Bot < ActiveRecord::Base

  def self.ocs_mentions
    CLIENT.search("#orlandocitysoccer", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.orlando_soccer
    CLIENT.search("Orlando soccer", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.make_it_count
    CLIENT.search("Orlando #makeItCount", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.orlando_city_soccer
    CLIENT.search("Orlando City Soccer", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.orlando_city_goal
    CLIENT.search("Orlando city Goal", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.orlando_mls
    CLIENT.search("Orlando MLS", result_type: "recent").take(1).each do |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.retweet(t)
    end
  end

  def self.search_words words
    CLIENT.search(words, lang: "en").first.text
  end

  def self.respond name
    "@"+name+" "+ Response.order_by_rand.first.message
  end

  def self.find_user number, words
    CLIENT.search(words, lang: "en").take(number).each { |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.update(Bot.respond(t.user.screen_name), in_reply_to_status_id: t.id)
    }
  end

end
