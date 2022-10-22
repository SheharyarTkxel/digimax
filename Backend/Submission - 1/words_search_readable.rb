require_relative "find_words_readable"
require 'byebug'

file = 'data/dictionary.txt'

fw = FindWordsReadable.new(file)
result_rd = fw.perform

puts result_rd
