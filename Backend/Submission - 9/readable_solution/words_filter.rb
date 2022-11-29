# Class used for filtertion of words
class WordsFilter
  attr_reader :words

  REQUIRED_WORD_LENGTH = 6

  def initialize(words)
    @words = words
  end

  def six_letter_words
    words.select { |word| word.size == REQUIRED_WORD_LENGTH }
  end

  def possible_combinations
    filtered_words = seprate_words_by_length

    fetch_possible_combinations(filtered_words)
  end

  private

  def fetch_possible_combinations(filtered_words)
    all_possible_comninations = []
    filtered_words.each do |key, array|
      all_possible_comninations += generate_combination(array, filtered_words[REQUIRED_WORD_LENGTH - key])
      break if key == REQUIRED_WORD_LENGTH / 2
    end

    all_possible_comninations
  end

  def seprate_words_by_length
    splitted_words = {}
    words.each do |word|
      word_length = word.length
      next if word_length >= REQUIRED_WORD_LENGTH || word_length.zero?

      (splitted_words[word_length] ||= []).push(word)
    end

    splitted_words
  end

  def generate_combination(words_array1, words_array2)
    words_array1.product(words_array2).map(&:join) + words_array2.product(words_array1).map(&:join)
  end
end
