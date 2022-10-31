require './get_optimized_concatenated_words'
require './get_concatenated_words'

describe GetOptimizedConcatenatedWords do

  context 'Comparing with optimized solution' do
    it 'Result words size should be valid worlds' do
      response = GetOptimizedConcatenatedWords.new('./spec/data/test_data.txt')

      expect(response.perform).to eq(['convex', 'tailor', 'weaver'])

    end
  end

  context 'Comparing with read solution' do
    it 'Result words size should be valid worlds' do
      response = GetConcatenatedWords.new('./spec/data/test_data.txt')

      expect(response.perform).to eq(['convex', 'tailor', 'weaver'])

    end
  end


end