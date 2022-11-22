class WordsFinderOptimized
  attr_accessor :collection, :file_path

  def initialize(file_path)
    @collection = Hash.new
    @file_path = file_path
  end

  def execute
    dictionary = read_data(file_path)

    dictionary.each do |word|
      (collection[word.size] ||= []) << word
    end

    
    collection[6].select do |word|
      (1..5).any? do |i|
        found_in_collection?(collection[i], word[0, i]) && 
          found_in_collection?(collection[6 - i], word[i..-1])
      end
    end
  end

  private

  def read_data(file_path)
    if File.exists?(file_path)
      File.read(file_path).split().reject { |word| word.size > 6 }.sort
    else
      raise "File not found!"
    end
  end

  def found_in_collection?(collection, query)
    collection.bsearch { |word| word >= query } == query
  end
end
