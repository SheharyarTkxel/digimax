require_relative "algorithm"

class Optimized < Algorithm

  def process
    results = []
    # group dictionary array words based on there length
    @words = @dictionary.group_by(&:length)
    # sort each individual array of grouped hash
    @words.flat_map { |k, v| v.sort! }

    [*1..WORD_LENGTH].each do |index|
      results += @words[WORD_LENGTH].filter { |word| concatenated?(word, index) }
    end
    results.uniq
  end

  private

  def concatenated?(word, index)
    searched?(@words[index], word[0..index-1]) &&
    searched?(@words[WORD_LENGTH-index], word[index..-1])
  end
end
