require 'spec_helper'

RSpec.describe Processor do
  
  context 'Valid data provided' do
    before { @file_content = FileReader.new('file/dict.txt').perform }
    it 'when file content' do
      response = described_class.new(@file_content).perform
      expect(response).to be_instance_of(Array)
      expect(response.length).to eq(1)
      expect(response.first).to eq('ababua')
    end
    it 'when no file content' do
      response = described_class.new(nil).perform  
      expect(response).to be_instance_of(NilClass)
    end
  end
end
