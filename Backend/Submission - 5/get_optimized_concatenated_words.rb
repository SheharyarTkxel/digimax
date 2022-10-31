class GetOptimizedConcatenatedWords
  def initialize(file)
    @file = file
  end

  def perform
    result = []
    
    dictionary = read_file(@file)

    words_hash = {}

    for word in dictionary
      next if word.length > 6

      words_hash[word] = word.length
    end

    words_hash.keys.each_with_object([]) do |word|
      next if word.length != 6
      if words_hash.key?(word[0, 3]) && words_hash.key?(word[3, 6])
        result << word
      end
      if words_hash.key?(word[0, 2]) && words_hash.key?(word[2, 6]) || words_hash.key?(word[0, 4]) && words_hash.key?(word[4, 6])
        result << word
      end
      if words_hash.key?(word[0, 1]) && words_hash.key?(word[1, 6]) || words_hash.key?(word[0, 5]) && words_hash.key?(word[5, 6])
        result << word
      end
    end
    result.uniq
  end

  def read_file(file)
    raise 'Provide a valid File' if file.nil?
    raise 'Inavlid file path' unless File.exists?(File.expand_path file)

    File.read(@file).split
  end
end
