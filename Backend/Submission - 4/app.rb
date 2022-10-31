require './config/initializers'

file = 'file/dictionary.txt'

file_reader = FileReader.new file
file_content =  file_reader.perform


processor = Processor.new(file_content)

words = processor.perform

puts words.join(', ')