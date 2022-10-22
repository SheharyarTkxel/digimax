require './services/dictionary_processor_optimized'
require './services/dictionary_processor'

describe DictionaryProcessor do
  before(:all) do
    @response1 = DictionaryProcessorOptimized.new.process
    @response2 = DictionaryProcessor.new.process
  end

  context 'Reading File' do
    it 'should read file and return response' do
      expect(@response1.length).not_to eq(0)
      expect(@response2.length).not_to eq(0)
    end
  end

  context 'Searching words' do
    it 'Should return words of length 6' do
      response_word_length1 = @response1.map(&:length).uniq
      response_word_length2 = @response2.map(&:length).uniq

      expect(response_word_length1.length).to eq(1)
      expect(response_word_length1.first).to eq(6)

      expect(response_word_length2.length).to eq(1)
      expect(response_word_length2.first).to eq(6)
    end
  end
end
