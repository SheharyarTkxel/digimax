require 'simplecov'
require_relative '../config/constants.rb'

SimpleCov.start do
  track_files 'models/*.rb'
  add_filter 'spec'
end

Dir[File.join(__dir__, '../models/','*.rb')].each { |file| require file }