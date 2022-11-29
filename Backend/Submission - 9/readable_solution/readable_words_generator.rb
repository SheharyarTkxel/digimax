require_relative '../dictionary_scanner'
require_relative './words_filter'

class ReadableWordsGenerator < DictionaryScanner
  attr_reader :words

  def initialize(file: nil)
    @words = scan_file(file)
  end

  def matchable_words
    return [] if words.empty?

    six_letter_words = WordsFilter.new(words).six_letter_words
    all_possible_combinations = WordsFilter.new(words).possible_combinations
    # Take intersection and Get Common words
    six_letter_words.intersection(all_possible_combinations)
  end
end
