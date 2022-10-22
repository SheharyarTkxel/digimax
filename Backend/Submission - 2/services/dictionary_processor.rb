class DictionaryProcessor

  DESIRED_WORD_LENGTH = 6

  attr_accessor :words_mapping, :concatenated_words

  def initialize
    @words_mapping = {}
    @concatenated_words = {}
  end

  def process
    read_words
    generate_concatenated_words
    matching_words
  end

  private def read_words
    words = File.read('./files/dictionary.txt').split

    result = Hash.new { |h, k| h[k] = [] }
    @words_mapping = words.each_with_object(result) do |word, res|
      res[word.length] << word
    end
  end

  private def generate_concatenated_words
    (1..3).to_a.each do |word_length|
      words_mapping[word_length].each do |word_1|
        words_mapping[(DESIRED_WORD_LENGTH - word_length)].each do |word_2|
          @concatenated_words["#{word_1}#{word_2}".downcase] = 1
          @concatenated_words["#{word_2}#{word_1}".downcase] = 1
        end
      end
    end
  end

  private def matching_words
    words_mapping[DESIRED_WORD_LENGTH].select { |word| concatenated_words.key?(word.downcase) }
  end
end
