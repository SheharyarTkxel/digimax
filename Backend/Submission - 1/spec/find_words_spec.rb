require './find_words_optimized'
require './find_words'
require './find_words_readable'
require 'byebug'

describe FindWords do
  context 'Raises exception' do
    it 'when no file provided' do
      response_op = FindWordsOptimized.new(nil)
      response_rd = FindWordsReadable.new(nil)

      expect{response_op.perform}.to raise_exception(RuntimeError, 'Provide a valid File')
      expect{response_rd.perform}.to raise_exception(RuntimeError, 'Provide a valid File')
    end

    it 'when file not exists' do
      response_op = FindWordsOptimized.new('random.txt')
      response_rd = FindWordsReadable.new('random.txt')
      
      expect{response_op.perform}.to raise_exception(RuntimeError, 'Inavlid file path')
      expect{response_rd.perform}.to raise_exception(RuntimeError, 'Inavlid file path')
    end
  end

  context 'Read Files' do
    it 'when file provided' do
      response_op = FindWordsOptimized.new('./spec/data/dictionary_test.txt')
      response_rd = FindWordsReadable.new('./spec/data/dictionary_test.txt')

      expect(response_op.perform).to eq(['convex', 'abcabc', 'obaidd'].sort)
      expect(response_rd.perform).to eq(['convex', 'abcabc', 'obaidd'])
    end
  end

  context 'Comparing the result' do
    it 'Result words size should be equal to 6' do
      response_op = FindWordsOptimized.new('./spec/data/dictionary_test.txt')
      response_rd = FindWordsReadable.new('./spec/data/dictionary_test.txt')

      expect(response_op.perform.any? { |word| word.length != 6 }).to eq(false)
      expect(response_rd.perform.any? { |word| word.length != 6 }).to eq(false)
    end
  end


end