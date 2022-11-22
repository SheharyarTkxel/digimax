require_relative "algorithm"

class Readable < Algorithm

  def process
    results = []
    # list of all words having length less than 6
    small_dictionary = filter_smaller_words
    # list of all words having length exactly equal to 6
    searchable_words = filter_searchable_words
    # loop on list of all words having length less than 6
    small_dictionary.each_with_index do |dictionary_word, index|
      small_dictionary.each do |word|
        if concatenated?(dictionary_word, word, searchable_words)
          #found a six-letter word that is built of two concatenated smaller words
          results << (dictionary_word + word)
        end
      end
    end
    results.uniq
  end

  private

  def filter_smaller_words
    @dictionary.select { |word| word.length < WORD_LENGTH }
  end

  def filter_searchable_words
    @dictionary.select { |word| word.length == WORD_LENGTH }.sort!
  end
  # to check both words after concatination present in all 6 length words listing
  # e.g con + vex = convex
  def concatenated?(dictionary_word, word, searchable_words)
    perfect_length?(dictionary_word.length, word.length) &&
      searched?(searchable_words, (dictionary_word + word))
  end
  # to check if sum of lengths of both subwords is equall to 6
  def perfect_length?(sub_word_1, sub_word_2)
    sub_word_1 + sub_word_2 == WORD_LENGTH
  end
end
