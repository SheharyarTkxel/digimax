require_relative "find_words"

class FindWordsReadable < FindWords
  def initialize(file=nil)
    @file = file
    @word_size = 6
  end

  def perform
    result = []
    
    dictionary = read_file(@file)

    words_size_6 = dictionary.dup
    words_smaller_6 = dictionary.dup
    
    words_size_6.reject! { |word| word.size != @word_size }      # words array with length 6
    words_smaller_6.reject! { |word| word.size >= @word_size }   # words array with length less than 6
    
    words_smaller_6.each do |w|
      words_size_6.each do |word|
        
        if (match_from_start(word, w))  && contains?(words_smaller_6, word[w.size..@word_size])       # matching substring from start and remaing string
          result << word
        elsif (match_from_end(word, w)) && contains?(words_smaller_6, word[0..@word_size - w.size - 1])  # matching substring from end and remaing string
          result << word
        end
      end
    end
    
    result.uniq
  end

  def contains?(list, word)
    return false unless list

    list.include? word
  end

  def read_file(file)
    raise 'Provide a valid File' if file.nil?
    raise 'Inavlid file path' unless File.exists?(File.expand_path file)

    File.read(@file).split
  end

  def match_from_start(word, w)
    word[0..w.size - 1] == w
  end

  def match_from_end(word, w)
    word[@word_size - w.size..@word_size] == w
  end
end
