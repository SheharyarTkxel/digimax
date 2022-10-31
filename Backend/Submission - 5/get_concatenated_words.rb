class GetConcatenatedWords
  def initialize(file)
    @file = file
  end

  def perform
    result = []
    wordsSixLetters = []

    dictionary = read_file(@file)

    # set 6 char words into new array
    for word in dictionary
      if (word.size == 6) 
        wordsSixLetters << word
      end
    end

    for word in wordsSixLetters
      for index in 0 ... word.size-1
        if dictionary.include?(word[0..index])
          if dictionary.include?(word[index+1..word.size-1])
            result << word
          end
        end
      end    
    end
    
    result.uniq
  end

  def read_file(file)
    raise 'File not found' if file.nil?
    raise 'Incorrect path' unless File.exists?(File.expand_path file)

    File.read(@file).split
  end
end
