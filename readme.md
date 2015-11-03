# Tunr 1.0!

We're going to be building Tunr, the worlds #1 music catalog / player (those
Spotify haters can't keep up with us).

## Part 1 - Database / Schema

In this exercise, your goal is to build out the schema for tunr, load it with
seed data, and run some sample queries to explore the data.

### Create the database

Create a postgres database called `tunr_db`. Make sure to use that **exact**
name, or you'll have trouble later on!

### Create a schema

Inside the db folder, create a `schema.sql` file, and then load it into your
`tunr_db` database.

Here's what our data model looks like:

*Artists*

| column name  | type |
|--------------|------|
| id   | primary key (int) |
| name | text |
| photo_url | text |
| nationality | text |

*Songs*

| column name  | type |
|--------------|------|
|id | primary key (int) |
|title | text |
|album | text |
|preview_url | text |
|artist_id | foreign key (int) |

### Load the Seed Data

Use psql to load the seed data located in `db/seed.sql`

### Play with the data

Using `psql`, play with the database, come up with some interesting sample
queries, and save them in a file in the db folder called `sample_queries.sql`

## Part 2.1 - Create the Artist Model using Active Record

1. Create an app.rb file for this application
2. Create a Gemfile using `bundle init`
3. Create a folder for your models (it should be called `models`)
4. Create a file that will contain your AR class definition for 'artists'
5. Add your dependencies into the Gemfile and then run `bundle install`


## Part 2.2 - Define artists & setup your app.rb to connect to the database

1. Define your artist model in `models/artist.rb`
2. Require your dependencies in `app.rb`
3. Establish connection to database using AR
4. Load pry at the end of `app.rb`

## Part 2.3 - Use your Artist Model

In the console:

1. Find all artists
2. Find just one artist by id
3. Find Taylor Swift (or your other fav artist) by **name**.
4. Find all artists from the USA
5. Find all artists NOT from the USA
6. Create a new artist for your favorite artist
7. Change at least 2 of their attributes
8. Destroy the artist you just created
  - (NOTE: If you destroy other artists at this point, you'll need to reseed your data for consistency.)

## Part 2.4 - Create your Song Model / Setup Associations

1. Create a file that will contain your AR class definition for Songs
2. Make sure to link that file in your main application file
3. Add corresponding associations to your models

## Part 2.5 - Use your Model Associations

In the console...  

1. Find the artist with the name Enya
2. Use AR methods to find all of Enya's songs, store them in a variable
3. Get the first song out of those results and get that song's title
4. Find the song with the title 'Unstoppable' and store in a variable
5. Get that song's artist, store that in a variable
6. Reassign the song's artist to be a different one (your choice)
7. Save that song
8. Create a new song, and associate it with a different artist of your choice
9. Delete that song
10. Find all of Enya's songs again, store in a variable
  - Using `each`, iterate over those songs and for each song, print "I like" + the song name

## Part 3 - Build a RESTful Interface using Sinatra

First you wrote the schema for a database to store records of artists and their songs for a music catalog app. You then seeded the database with sample data and we were able to interact with that data (performing CRUD operations) using SQL queries in Postgresql. Next, you connected ActiveRecord to the database which enhanced your ability to interact with the data in a Ruby environment. Still, our only way to interact with the data is in a console.

Before we get started, checkout this branch and `bundle install` Today, you are going to use Sinatra to listen for HTTP requests and serve HTML (rendered from ERB templates) in response.

The first route we are going to write will handle GET requests made to the root of the app ('/'). We add this route to our _General routes_ section of our app.rb file because it is not requesting information regarding one of our models (TODO: work on this language).
(TODO: add screenshot)
