class WordsFinder
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

    result = []

    collection[6].each do |word|
      [1, 2, 3, 4, 5].each do |i|
        first_half = word[0, i]
        second_half = word[i..-1]

        found = collection[i].include?(first_half) && collection[6 - i].include?(second_half)
        if found == true
          result << word
        end
      end
    end

    return result.uniq
  end

  private

  def read_data(file_path)
    if File.exists?(file_path)
      File.read(file_path).split().reject { |word| word.size > 6 }.sort
    else
      raise "File not found!"
    end
  end
end
