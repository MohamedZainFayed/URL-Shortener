# URL Shortener

This is a simple rails app to shorten long URLs to reasonably short links using `ruby 2.6.3` with `Rails 6.0.2.1` and `mySQL` database and tested using `rspec-rails`.

## Installation and running

**First**, you will need to install the required `ruby` and `rails` versions and have `mySQL` server installed on your machine.
**Second**, you will need to clone the project, go to the project directory and run the command `bundle`.
**Third**, you need to export your database user name and password as environment variables as follows:
```
export DATABASE_USERNAME=yourDatabaseUsername
export DATABASE_PASSWORD=yourDatabasePassword
```
**Last**, run `rails s` to get the server up and running.

## Testing

To run the test cases, just run the command `rspec` in the project directory to execute all the test cases!