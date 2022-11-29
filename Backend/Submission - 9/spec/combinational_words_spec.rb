require_relative '../readable_solution/readable_words_generator'
require_relative '../optimized_solution/optimize_words_generator'

require 'byebug'

describe 'CombinationWords' do
  before(:all) do
    @optimized_solution_res ||= OptimizeWordsGenerator.new(file: 'dictionary.txt').matchable_words
    @readable_solution_res ||= ReadableWordsGenerator.new(file: 'dictionary.txt').matchable_words
  end

  context 'Raise errors' do
    it 'will raise error if not provided' do
      expect { OptimizeWordsGenerator.new(file: nil) }.to raise_exception(RuntimeError, 'Empty file path')
      expect { ReadableWordsGenerator.new(file: nil) }.to raise_exception(RuntimeError, 'Empty file path')
    end

    it 'will raise error if file not present' do
      expect { OptimizeWordsGenerator.new(file: 'sample.txt') }.to raise_exception(RuntimeError, 'File not present')
      expect { ReadableWordsGenerator.new(file: 'sample.txt') }.to raise_exception(RuntimeError, 'File not present')
    end

    it 'will raise error file format is not valid' do
      expect { OptimizeWordsGenerator.new(file: 'spec/files/dictionary.csv') }.to raise_exception(RuntimeError, 'Invalid format')
      expect { ReadableWordsGenerator.new(file: 'spec/files/dictionary.csv') }.to raise_exception(RuntimeError, 'Invalid format')
    end
  end

  context 'Scan file' do
    it 'will read a file and return results' do
      expect(@optimized_solution_res).to_not be_nil
      expect(@readable_solution_res).to_not be_nil
    end

    it 'will validte that the result is correct' do
      expect(@optimized_solution_res).to include('abacay', 'Zunian', 'Abaris', 'zootic')
      expect(@readable_solution_res).to include('abacay', 'Zunian', 'Abaris', 'zootic')

      expect(@optimized_solution_res.count).to eq(10799)
      expect(@readable_solution_res.count).to eq(10799)
    end
  end

  context 'validate the final result' do
    it 'will check that every word have 6 letters' do
      expect(@optimized_solution_res.find { |word| word.length == 6 }).to_not be_nil
      expect(@readable_solution_res.find { |word| word.length == 6 }).to_not be_nil
    end
  end
end
