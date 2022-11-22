# base class for both readble and optimized algorithms
class Algorithm
  require "date"
  require "byebug"

  WORD_LENGTH = 6

  def initialize(file_path)
    @dictionary = read_file_content file_path
  end
  # to trigger processing of any child algorithm
  def self.for provider, file_path
    provider.new(file_path).process
  end

  private
  # read file contents or throw expectations otherwise
  def read_file_content file_path
    raise "File path is empty" if file_path.nil?
    raise "File doesn't exist" unless File.exists?(File.expand_path file_path)
    File.read(file_path).split
  end
  # search single word from list of words
  def searched?(small_dictionary, smaller_word)
    small_dictionary && small_dictionary.bsearch {|w| smaller_word <=> w }
  end
end
