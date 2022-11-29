class DictionaryScanner
  def scan_file(file)
    raise 'Empty file path' if file.nil?
    raise 'File not present' unless File.exists?(File.expand_path file)

    file_extension = File.extname(file)
    raise 'Invalid format' unless file_extension == '.txt'

    file = File.open(file, 'r')
    data = file.read
    file.close

    data&.split(/\n+/)
  end
end
