require_relative "algorithm"
require_relative "readable"
require_relative "optimized"

# run both algorithms
providers = [Readable, Optimized]
providers.each do |provider|
  results = Algorithm.for(provider, 'dictionary.txt')
  puts results
end
