# Raven

An innovative way to purchase and manage flight tickets - created by [Daniel Mekuriaw](https://github.com/danielmekuriaw) and [Mohamed Mohamud](https://github.com/Atlmoe6).

This project is developed using Ruby, ActiveRecord and SQLite3. For the sake of simplicity and due to the limited amount of time for development, it makes use of data from the **Faker** Ruby gem outside of accepting direct user inputs.

### Gems

* **sinatra-activerecord** - for accessing databases
* **sqlite3** - for database management
* **pry** - for debugging during development
* **require_all** - for accessing files from within different directories of the program
* **faker** - for generating random data
* **tty-prompt** - for accepting user inputs in different formats
* **tty-table** - for displaying data in a table
* **tty-box** - for displaying data in a box
* **tty-font** - for creating the **Raven** logo that appears at the start of the program

### Setup Instructions

**NOTE:** *Make sure you have properly installed Ruby on your terminal. Follow the instructions below after verifying that you have correctly installed ruby through the following command. It should return a Ruby version if you have Ruby installed.*

```Ruby
ruby --version
```

The next step is installing the required gems. This can be done with the following command:
```Ruby 
bundle install
```

In case you run onto an error while calling the command above, try installing each gem individually as follows:
```Ruby
gem install name_of_gem
```

### Running the Program
To run the program, call the following after navigating to the project's directory on your terminal:

```Ruby
ruby bin/run.rb
```

### File Structure


├── CONTRIBUTING.md

├── Gemfile

├── Gemfile.lock

├── LICENSE.md

├── README.md

├── Rakefile

├── bin

│   └── run.rb

├── config

│   ├── database.yml

│   └── environment.rb

├── db

│   ├── development.db

│   ├── migrate

│   │   ├── 20210622161112_create_airlines.rb

│   │   ├── 20210622161217_create_users.rb

│   │   ├── 20210622161228_create_tickets.rb

│   │   └── 20210624191655_create_review.rb

│   ├── schema.rb

│   └── seeds.rb

└── lib

    ├── airline.rb

    ├── cli.rb

    ├── review.rb

    ├── ticket.rb

    └── user.rb