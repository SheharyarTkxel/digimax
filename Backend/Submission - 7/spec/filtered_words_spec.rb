require_relative "../filtered_words"
require_relative "../optimized_filtered_words"

describe FilteredWords do

  context 'Searching words' do

    before(:all) do
      path = 'dictionary_example.txt'
      @filtered_words = described_class.new(path).call
      @optimized_filtered_words = OptimizedFilteredWords.new(path).call
    end

    it 'Should be equal result for filtered words and optimized filtered words' do
      expect(@filtered_words.size).to eq(@optimized_filtered_words.size)
    end

    it 'Result words size should be equal to 6' do
      expect(@filtered_words.map { |word| word.length == 6 }.include?(false)).to eq(false)
      expect(@optimized_filtered_words.map { |word| word.length == 6 }.include?(false)).to eq(false)
    end

    it 'Should return words of length 6' do
      expect(@filtered_words.size).to eq(3)
      expect(@optimized_filtered_words.size).to eq(3)
    end

    it 'Result should be sorted' do
      expect(@filtered_words).to eq(["convex", "weaver", "tailor"].sort)
      expect(@optimized_filtered_words).to eq(["convex", "weaver", "tailor"].sort)
    end

  end

  context 'Searching words for wrong files' do

    it 'Should return empty array when file was empty' do
      filtered_words = described_class.new('dictionary_empty_data.txt').call
      optimized_filtered_words = OptimizedFilteredWords.new('dictionary_empty_data.txt').call
      expect(filtered_words).to eq([])
      expect(optimized_filtered_words).to eq(nil)
    end

    it 'Raise error for file not found!' do
      expect { described_class.new("path.txt").call }.to raise_error
      expect { OptimizedFilteredWords.new("path.txt").call }.to raise_error
    end

  end
end
