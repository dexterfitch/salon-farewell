##Salon Farewell!
by Dex Fitch

A simple web app that lets you enter stylists and create clientele lists for each stylist.

##Setup

Assuming you have postgres and psql set up on your system, create a database called:

'salon'

Within 'salon', paste:

'CREATE TABLE clients (id serial PRIMARY KEY, client_name varchar, stylist_id int);'

'CREATE TABLE stylists (id serial PRIMARY KEY, stylist_name varchar);'

Also assuming you have ruby installed, in the terminal, navigate to the project folder and then:

`gem install bundle`

`bundle`

`ruby app.rb`

Go to http://localhost:4567 in your browser

Enjoy!

##Tests
Testing the ruby methods can be done via rspec.

##Motivation

To practice creating a one-to-many database that interacts with the front-end.

##License

MIT License, copyright 2015 dexfitch
