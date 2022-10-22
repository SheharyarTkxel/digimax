require 'benchmark'
require 'byebug'

class Dictionary
  attr_accessor :words, :words_hash, :words_array

  def initialize
    @words_hash = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    @words_array = []
    @words = File.readlines('./dictionary.txt', chomp: true).each do |word|
      words_hash[word.length][word] = word
      words_array << word
    end
  end

  def find_words
    find_words_slow
  end

  private

  def find_words_slow
    results = {}
    words_array.select { |word_string| word_string.length == 6 }.each do |word|
      word.length.times do |i|
        next unless words_array.include?(word.slice(0..i)) && words_array.include?(word.slice(i + 1..word.length - 1))
        results["#{word.slice(0..i)}_#{word.slice(i + 1..word.length - 1)}"] = word
      end
    end
    results
  end

  def find_words_fast
    results = {}
    words_hash[6]&.each do |word, value|
      (0..4).each do |i|
        if words_hash[i + 1]&.has_key?(word[0..i]) && words_hash[6 - (i + 1)]&.has_key?(word[(i + 1)..])
            results["#{word[0..i]}_#{word[(i + 1)..]}"] = word
        end
      end
    end
    results
  end
end


