class FilteredWords
  require 'byebug'
  attr_reader :file, :data, :data_hash

  def initialize(file_path)
    @file = file_path
    @data = remove_extra_words
    @data_hash = {}
  end

  def call
    find_word
  end

  private

  def remove_extra_words
    file_data = File.read(file).split
    file_data.reject! { |word| word.size > 7 }
  end

  def hash_for_words
    data&.each do |w|
      data_hash[w.length] ||= []
      data_hash[w.length] << w
    end
    data_hash&.each { |k, v| v.sort! }
  end

  def find_word
    hash_for_words
    dictionary = []
    data_hash[6]&.each do |word|
      (1..5).any? do |i|
        dictionary << word if word_exist?(data_hash[i], word[0, i]) && word_exist?(data_hash[6 - i], word[i..-1])
      end
    end
    dictionary
  end

  def word_exist?(word_arr, word)
    return false if word_arr.nil?
    searched_word = word_arr.bsearch { |w| w >= word }
    searched_word == word
  end

end
