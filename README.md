Simple CLI Search
================
This is a command line application with a simple user interface to search the data and return matching results. Once a user has found a matching result, the user can then find all related entries using the options. All results are rendered in nicely formatted tables.

__Setup__:

1. bundle gems
    ```
    bundle install
    ```
2. Setup the database (default postgres)
    * Download postgres from https://www.postgresql.org/
    * Start postgres server
    * Alternatively, you can run mysql by adding 'mysql2' to the gemfile and updating the adapter in the 'db/config.yml' file
3. Run all the rake tasks to
    * create the database
      ```
      rake db:create
      ```
    * setup the schema
      ```
      rake db:migrate
      ```
    * seed the database
      ```
      rake db:seed
      ```
4. Load the boot file from the app folder
    ```
    ruby boot.rb
    ```

__Design__:

For the database, I decided to use active records on top of postgres because it's a solid, proven technology and scales well. It took me a little longer to set up the database due to the unconventional configuration - primary keys, rake tasks, and active records without rails. Another option I considered was rolling my own ORM and saving the records in space on boot of the app but ended up going with active records in the end.

For the user interface, I ended up creating controllers that were responsible for rendering views and handling the user input. They were also responsible for determining which controller to initiate next.
