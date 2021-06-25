# Raven

created by Daniel Mekuriaw and Mohamed Mohamud.

This project is developed using Ruby, ActiveRecord and SQLite3. For the sake of simplicity and due to the limited amount of time for development, it makes use of data from the **Faker** Ruby gem outside of accepting direct user inputs.

### Gems

* sinatra-activerecord - for database management
* sqlite3 - for database management
* pry - for debugging
* require_all - for accessing files
* faker - for generating random data
* tty-prompt - for accepting user inputs in different formats
* tty-table - for displaying data in a table
* tty-box - for displaying data in a box
* tty-font - for creating the **Raven** logo that appears at the start of the program

### Setup Instructions

Installing required gems
'''SQL 
bundle install
'''

In case you run onto an error, try installing each gem individually as follows:
'''SQL
gem install 'name_of_gem'
'''

### Running the Program
To run the program, call the following after navigating to the project's directory:

'''Ruby
ruby bin/run.rb
'''