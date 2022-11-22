require "benchmark"
require_relative "./words_finder"
require_relative "./words_finder_optimized"

# Driver program
Benchmark.bm(8) do |x| 
  x.report("unoptimized:") {
    six_letter_words = WordsFinder.new("./dictionary.txt").execute
  }

  x.report("optimized:  ") {
    six_letter_words = WordsFinderOptimized.new("./dictionary.txt").execute
  }
end
