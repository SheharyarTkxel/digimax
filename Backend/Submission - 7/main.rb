require_relative "filtered_words"
require_relative 'optimized_filtered_words'
require 'benchmark'

path  = 'dictionary.txt'
if File.exists?(path)
  filtered_words = FilteredWords.new(path).call
  puts filtered_words
  puts
  optimized_filtered_words = OptimizedFilteredWords.new(path).call
  puts optimized_filtered_words
  puts
  puts "Filtered words count: #{filtered_words.size}"
  puts "Optimized Filtered words count: #{optimized_filtered_words.size}"
  puts
  puts "Benchmark for filtered words:"
  puts Benchmark.measure { FilteredWords.new(path).call }
  puts
  puts "Benchmark for optimized filtered words:"
  puts Benchmark.measure { OptimizedFilteredWords.new(path).call }
else
  raise 'File not found!'
end