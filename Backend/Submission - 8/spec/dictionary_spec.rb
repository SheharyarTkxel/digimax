require './algorithm'
require './readable'
require './optimized'

describe 'processing dictionary' do

  before(:context) do
    @readable_dictionary  = Algorithm.for(Readable,  './spec/fixtures/sample_dictionary.txt')
    @optimized_dictionary = Algorithm.for(Optimized, './spec/fixtures/sample_dictionary.txt')
  end

  context 'with valid file' do
    it 'readable algorithm should returns' do
      expect(@readable_dictionary).to eq(['convex', 'tailor', 'weaver'])
    end

    it 'readable algorithm should returns' do
      expect(@optimized_dictionary).to eq( ["weaver", "convex", "tailor"])
    end
  end

  context 'with empty file path' do
    it 'readable algorithm should raise' do
      expect{Algorithm.for(Readable,  nil)}.to raise_exception(RuntimeError, 'File path is empty')
    end

    it 'optimized algorithm should raise' do
      expect{Algorithm.for(Optimized,  nil)}.to raise_exception(RuntimeError, 'File path is empty')
    end
  end

  context 'with wrong file path' do
    it 'readable algorithm should raise' do
      expect{Algorithm.for(Readable,  './spec/fixtures/random_sample.txt')}.to raise_exception(RuntimeError, 'File doesn\'t exist')
    end

    it 'optimized algorithm should raise' do
      expect{Algorithm.for(Optimized,  './spec/fixtures/random_sample.txt')}.to raise_exception(RuntimeError, 'File doesn\'t exist')
    end
  end
end
