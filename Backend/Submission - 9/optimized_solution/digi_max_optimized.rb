require 'pry'
require_relative './optimize_words_generator'

FILE_NAME = 'dictionary.txt'.freeze

begin
  result = OptimizeWordsGenerator.new(file: FILE_NAME).matchable_words
rescue StandardError => e
  puts e.message
end

puts "Total no of required words = #{result.length}" if result.is_a?(Array)
