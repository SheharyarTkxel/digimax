require_relative "find_words_optimized"
require 'byebug'

file = 'data/dictionary.txt'

fw = FindWordsOptimized.new(file)
result_op = fw.perform

puts result_op
