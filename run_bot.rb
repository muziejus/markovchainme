require_relative 'markovchainme'

tweet = Markovchainme.new
if ARGV[0] == "random" # Called from the command line to make a random sentence.
  tweet_text = tweet.random_sentence
  tweet.tweet(tweet_text)
elsif ARGV[0] == "term" # Called from the command line to seed a sentence.
  tweet.set_triple_array
  tweet.tweet(tweet.build_sentence(ARGV[1]))
else # must a cron job, looking for @s.
  reply_ids = []
  tweet.replies.each do |reply|
    reply_ids.push(reply.id)
    puts "reply: #{reply.id} - #{reply.text}"
    match = /^.*@MarkovChainMe:* do @(\w*).*$/i.match(reply.text)
    match.nil? ? user = reply.user.screen_name : user = match[1]
    tweet_text = tweet.random_sentence(user)
    tweet_text = "@" + reply.user.screen_name + " " + tweet_text
    puts tweet_text
    tweet.tweet(tweet_text, reply.id)
  end
  # Run this after everything instead and get a better way of getting the most recent since_id
  tweet.update_since_id(reply_ids.max) unless reply_ids.max.nil?
end

