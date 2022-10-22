class DictionaryProcessorOptimized

  DESIRED_WORD_LENGTH = 6

  attr_accessor :words_mapping, :concatenated_words

  def initialize
    @words_mapping = {}
    @concatenated_words = {}
  end

  def process
    read_words
    matching_words
  end

  private def read_words
    words = File.read('./files/dictionary.txt').split
    words.each do |word|
      next if word.length > DESIRED_WORD_LENGTH

      words_mapping[word] = word.length
    end
  end

  private def matching_words
    result = words_mapping.keys.each_with_object([]) do |word, res|
      next if word.length != DESIRED_WORD_LENGTH

      res << word if is_one_five_combination?(word)
      res << word if is_two_four_combination?(word)
      res << word if is_three_three_combination?(word)
    end
    result
  end

  private def is_one_five_combination?(word)
    words_mapping.key?(word[0, 3]) && words_mapping.key?(word[3, 6])
  end

  private def is_two_four_combination?(word)
    words_mapping.key?(word[0, 2]) && words_mapping.key?(word[2, 6]) ||
      words_mapping.key?(word[0, 4]) && words_mapping.key?(word[4, 6])
  end

  private def is_three_three_combination?(word)
    words_mapping.key?(word[0, 1]) && words_mapping.key?(word[1, 6]) ||
      words_mapping.key?(word[0, 5]) && words_mapping.key?(word[5, 6])
  end
end
