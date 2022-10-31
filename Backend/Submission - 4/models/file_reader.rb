class FileReader
  def initialize(file=nil)
    @file = file
  end

  def perform
    file_provided
    file_exists
    read_file
  end

  private

  def file_provided
    raise FILE_NOT_PROVIDED_MESSAGE if @file.nil?
  end

  def file_exists
    raise FILE_NOT_EXIST_MESSAGE unless File.exists?(File.expand_path @file)
  end

  def read_file
    # get the absolute pathname
    file = File.open(File.expand_path @file)
    file_data = file.read
    file.close
    file_data 
  end
end
