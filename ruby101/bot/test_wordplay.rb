require 'minitest/autorun'
load 'wordplay.rb'

class TestWordPlay < Minitest::Unit::TestCase

  def test_sentences
    assert_equal ["a","b","c d", "e f g"], "a. b. c d. e f g.".sentences
    test_text = %q{Hello.  This is a test_text
      of sentence separation.  This is the end of the test.}
    assert_equal "This is the end of the test", test_text.sentences.last
  end
  def test_words
    assert_equal %w{this is a test}, "this is a test".words
    assert_equal %w{these are mostly words}, "these are, mostly,  words".words    
  end
  def sentence_choice
    assert_equal('This is a great test', 
      WordPlay.best_sentence(['This is a test',


        'This is another test',
                                'This is a great test'],
                                %w{test great this}))
    assert_equal('This is a great test',
      WordPlay.best_sentence(['This is a great test'], %w{still the best}))
  end
  def test_basic_pronouns
    assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
    assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
    
  end
end