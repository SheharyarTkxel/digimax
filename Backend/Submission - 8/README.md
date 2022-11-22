# Dictionary Processing Algorithms

**What does code do**
This code search words that are combination of two smaller words from dictionary. Words should be of length six. Word combination can be any length.

**Testing Environment**
- Ubuntu 20.04

**Pre-requisites**
- Ruby 3.0.0

**Test Environment**
Ubuntu 20.04

**How to run**

You need ruby installed in your system. You can install ruby from the below link.
https://gorails.com/setup/ubuntu/22.04
ruby version 3.0.0

**Compilation**

- Open terminal in the project directory.
- Install the bundle by the following command (bundle install)
- Run the app.rb file. It will run the both (readble + optimized) algorithms. <Command to Run>: ruby app.rb
- If you want to run only readable algorithm, remove <Optimized> option from providers list in app.rb file.
- If you want to run only optimized algorithm, remove <Readable> option from providers list in app.rb file.
- Results of both algorithms will be the list of all six length words that are built from combination of 2 small words.

**Run Test Case**

- Run the test cases with the following command in you terminal. <Command to Run>: rspec
- Result will show the success and failed (if any) test cases on the terminal.
- Test cases covered all positive & negative scenarios.
