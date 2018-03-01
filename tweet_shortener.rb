require 'pry'

def dictionary
  words_to_shorten = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&",
  }
  words_to_shorten
end

def word_substituter(tweet)
  tweet_array = tweet.split(" ")

  tweet_array.each do |word|
    dictionary.each do |key, value|
      if word.downcase == key
        word.replace(value)
      end
    end
  end

  tweet_array.join(" ")
end

def bulk_tweet_shortener(array)
  new_array = []
  array.collect do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    return word_substituter(tweet)
  else
    return tweet
  end
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = ""

  if tweet.length > 140
    shortened_tweet << word_substituter(tweet)
  else
    return tweet
  end


  if shortened_tweet.length > 140
    "#{shortened_tweet[0..136]}..."
  end

end
