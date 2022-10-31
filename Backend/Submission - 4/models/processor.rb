require  'pry'
class Processor
  def initialize(data)
    @data = data
  end

  def perform
    filter_data
  end

  private

  def filter_data
    desired_words = []
    return if @data.nil?
    filtered_words = get_words_in_array
    six_letter_words = filtered_words.select { |word| word.length == DESIRED_LENGTH }

    for word in six_letter_words
      for index in 0..word.length - 1
        if filtered_words.include?(word[0..index])
          desired_words << word if filtered_words.include?(word[index+1..word.length-1])
        end
      end
    end
    desired_words.uniq
  end

  def get_words_in_array
    words= @data.chomp.split
    words.reject! { |word| word.length > DESIRED_LENGTH }
    words.each(&:downcase!)
  end
end
