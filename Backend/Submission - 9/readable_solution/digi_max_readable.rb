require 'pry'
require_relative './readable_words_generator'

FILE_NAME = 'dictionary.txt'.freeze

begin
  result = ReadableWordsGenerator.new(file: FILE_NAME).matchable_words
rescue StandardError => e
  puts e.message
end

puts "Total no of required words = #{result.length}" if result.is_a?(Array)
