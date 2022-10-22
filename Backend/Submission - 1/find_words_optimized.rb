require_relative "find_words"

class FindWordsOptimized < FindWords
  def initialize(file=nil)
    @file = file
    @word_size = 6
  end

  def perform
    result = []
    
    dictionary = read_file(@file)
    
    words = convert_to_hash(dictionary)
      
    words.keys.each {|i|
      words[@word_size].select{|word| 
        result << word if found_substring?(words, word, i)}   # matching the substring of word in the list.
    }
    
    result.uniq
  end

  def found_substring?(words, word, i)
    (contains?(words[i], word[0..i-1])) && (contains?(words[@word_size-i], word[i..-1]))
  end

  def read_file(file)
    raise 'Provide a valid File' if file.nil?
    raise 'Inavlid file path' unless File.exists?(File.expand_path file)

    File.read(@file).split
  end

  def convert_to_hash(dictionary, hash = {})
    dictionary.reject! { |word| word.size > @word_size }   # removing word greater than length 6
    dictionary.each do |w|
      (hash[w.length] ||=[]) << w                         # store word with their length as key in hash
    end

    hash.keys.each{|x| hash[x].sort!}                     # sorting the values for bsearch
    hash
  end

  def contains?(list, word)
    return false unless list

    wd = list.bsearch {|w| word <=> w }  #searching the word in list
    wd && wd == word
  end
end
