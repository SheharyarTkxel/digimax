# How to run:
```
- Navigate in to directory
- rvm use [To use the listed ruby version]
- bundle install [To install all the dependencies]
- rvm use [to use the ruby version specified]
- ruby app.rb
```

# How to run tests and generate coverage report
- rspec
- Navigate in coverage folder of the task and look out for index.html [simplecov gem]

# Directories
- [coverage/] for test case coverage
- [models/] for all the classes for single responsibility
- [spec/] for test cases for classes 

# Files
- [.rspec] for rspec configurations
- [.ruby-version] for specifing ruby version
- [app.rb] for main application interacting with all the files and classes
- [contants.rb] for all the log messages
- [Gemfile] for additional gems
- [Gemfile.lock] store the record of gem version used in application
- [initializers.rb] to load the defaults dependencies

# How it works
- dictionary is read by FileReader class
- Processor class then parsed the data from FileReader into usable array i.e following contraints
- app recieves the data and print it on the console