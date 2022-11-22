require_relative "../words_finder"
require_relative "../words_finder_optimized"

describe WordsFinder do
  context 'Reading input file' do
    it 'Should raise exception given incorrect file path' do
      expect { 
        described_class.new("wrong_file.txt").execute 
      }.to raise_error(RuntimeError, 'File not found!')
    end
  end

  context 'Finding six letter words that match criteria' do
    before(:all) do
      @six_letter_words = described_class.new('./spec/test_data.txt').execute
    end
    
    it 'Should return an array of size 3' do
      expect(@six_letter_words.size).to eq(3)
    end

    it 'Should return an array of six letter words' do
      expect(@six_letter_words.map(&:size).uniq).to eq([6])
    end

    it 'Should return the correct result' do
      expect(@six_letter_words).to match_array(["convex", "weaver", "tailor"]) 
    end
  end
end
