require_relative 'main'
require_relative "dictionary"
require "minitest/autorun"
require "minitest/spec"


describe Dictionary do
  describe '#find_words' do
    before do
      @dict = Dictionary.new
    end

    it 'return empty hash for empty file' do
      @dict.words_array = []
      @dict.words_hash = {}
      assert_equal({}, @dict.find_words)
    end

    it 'does not check less-than-six letter words' do
      @dict.words_array = ["ba", "nana", "banan"]
      @dict.words_hash = {2 =>  {"ba": "ba"}, 4 => {"nana": "nana"}, 5 => {"banan": "banan"} }
      assert_equal({}, @dict.find_words)
    end

    it 'only checks six letter words' do
      @dict.words_array = ["ba", "nana", "banan", "banana"]
      @dict.words_hash = {2 =>  {"ba" => "ba"}, 4 => {"nana" => "nana"}, 5 => {"banan" => "banan"}, 6 => {"banana" => "banana"} }
      assert_equal({"ba_nana" => "banana"}, @dict.find_words)
    end


    it 'checks for multiple combinations for same six letter word' do
      @dict.words_array = ["a", "ba", "nana", "banan", "banana"]
      @dict.words_hash = {1 => {"a" => "a"}, 2 =>  {"ba" => "ba"}, 4 => {"nana" => "nana"}, 5 => {"banan" => "banan"}, 6 => {"banana" => "banana"} }
      assert_equal({ "ba_nana" => "banana", "banan_a" => "banana"}, @dict.find_words)
    end

    it 'checks  and returns no valid combination' do
      @dict.words_array = ["a", "abc", "abcd", "abcde", "banana"]
      @dict.words_hash = {1 => {"a" => "a"}, 3 =>  {"abc" => "abc"}, 4 => {"abcd" => "abcd"}, 5 => {"abcde" => "abcde"}, 6 => {"banana" => "banana"} }
      assert_equal({}, @dict.find_words)
    end

  end
end

