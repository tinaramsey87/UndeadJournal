# UndeadJournal

This is a simple journal app where users can write posts and comment on each other's posts.

## Set-up

Requires Ruby 2.2.0, Postgres, and ActiveRecord

To start using Undead Journal, first clone this git repository.

Create a new database and run rake db:schema:load

Start a rails server and navigate web browser to localhost:3000

Or, use this link to reach the live Heroku deployment:

https://quiet-lake-9545.herokuapp.com

## Issues

-Adding comment spec fails; not sure why.
-I'm not saving sent messages so I haven't written model tests for messages. 

## Author

Tina Ramsey

## License

GNU GPL License
