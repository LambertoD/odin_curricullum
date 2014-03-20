# Text Analyzer
stop_words = %w{the a by on for of are with just but and to the my I has some in}
# lines = File.readlines("files/text.txt")
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join
# Count the characters
character_count = text.length
total_characters_no_spaces = text.gsub(/s+/,'').length

# Count the words, sentences, paragraphs
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|\!/).length

# Make list of words that are not stop words and get percentage
all_words = text.scan(/\w+/)
good_words = all_words.select { |word| !stop_words.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize text by cherry picking average sized sentences containing IS and ARE
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third+1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines "
puts "#{character_count} total characters"
puts "#{total_characters_no_spaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{word_count / sentence_count} words per sentence ( average )"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary: \n\n" + ideal_sentences.join(". ")
puts "End of Text Analyzer"