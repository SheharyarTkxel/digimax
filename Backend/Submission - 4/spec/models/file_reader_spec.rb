require 'spec_helper'

RSpec.describe FileReader do
  context 'Raises exception' do
    it 'when no file provided' do
      response = described_class.new(nil)
      expect{response.perform}.to raise_exception(RuntimeError, FILE_NOT_PROVIDED_MESSAGE)
    end
    it 'when file not exists' do
      response = described_class.new('random.txt')
      expect{response.perform}.to raise_exception(RuntimeError, FILE_NOT_EXIST_MESSAGE)
    end
  end
  context 'Read Files' do
    it 'when file provided' do
      response = described_class.new('file/dictionary.txt')
      expect(response.perform).to be_instance_of(String)
    end
  end
end
