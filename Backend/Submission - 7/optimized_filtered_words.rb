class OptimizedFilteredWords
  attr_reader :file, :data, :max_word_size, :data_hash, :data_dictionary

  def initialize(file_path)
    @file = file_path
    @max_word_size = 6
    @data = read_file
    @data_hash = {}
  end

  def call
    begin
      find_word
    rescue StandardError => error
      puts error.message
    end
  end

  private

  def read_file
    File.read(file).split
  end

  def hash_for_words
    data&.each { |w| (data_hash[w.length] ||= []) << w if w.length <= max_word_size }
    data_hash&.each { |k, v| v.sort! }
  end

  def find_word
    hash_for_words
    data_hash[max_word_size]&.select do |word|
      (1..5).any? do |i|
        word_exist?(data_hash[i], word[0, i]) && word_exist?(data_hash[max_word_size - i], word[i..-1])
      end
    end
  end

  def word_exist?(word_arr, word)
    return false if word_arr.nil?
    searched_word = word_arr.bsearch { |w| w >= word }
    searched_word == word
  end

end
