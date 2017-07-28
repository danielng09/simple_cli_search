Zendesk CLI Search
================
This is a command line application with a simple user interface to search the data and return matching results.

__Setup__:
1. bundle gems
    'bundle install'
2. Setup the database - I used postgres
3. Run all the rake tasks to
  - create the database
      'rake db:create'
  - setup the schema
      'rake db:migrate'
  - seed the database
      'rake db:seed'
4. Load the boot file from the app folder
    'ruby boot.rb'
