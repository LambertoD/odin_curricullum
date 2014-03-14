def find_frequency(sentence, word)
  words = sentence.split(' ')
  word_hash = Hash.new(0)
  words.each do |item|
    word_hash[item.downcase] += 1  
  end
  word_hash[word.downcase]
end