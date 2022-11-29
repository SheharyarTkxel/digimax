require_relative '../dictionary_scanner'

class OptimizeWordsGenerator < DictionaryScanner
  attr_reader :words

  REQUIRED_WORD_LENGTH = 6

  def initialize(file: nil) 
    @words = scan_file(file)
  end

  def matchable_words
    return [] if words.empty?

    matchable_words_hash, six_letter_words = convert_words_into_keys
    fetch_matching_words(matchable_words_hash, six_letter_words)
  end

  private

  def convert_words_into_keys
    matchable_words_hash = {}
    six_letter_words = []

    words.each do |word|
      word_length = word.length
      six_letter_words << word if word_length == REQUIRED_WORD_LENGTH
      next if word_length >= REQUIRED_WORD_LENGTH || word_length.zero?

      matchable_words_hash[word] = word_length
    end
    [matchable_words_hash, six_letter_words]
  end

  def fetch_matching_words(hash, six_letter_words)
    finalized_array = []
    six_letter_words.each do |word|
      if hash.key?(word[0]) && hash.key?(word[1..5]) || hash.key?(word[0..4]) && hash.key?(word[5..6])
        finalized_array << word
      elsif hash.key?(word[0..1]) && hash.key?(word[2..5]) || hash.key?(word[0..3]) && hash.key?(word[4..5])
        finalized_array << word
      elsif hash.key?(word[0..2]) && hash.key?(word[3..5])
        finalized_array << word
      end
    end
    finalized_array.uniq
  end
end
