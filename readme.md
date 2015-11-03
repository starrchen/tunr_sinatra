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

Today, you are going to use Sinatra to listen for HTTP requests and serve HTML (rendered from ERB templates) in response.

### Part 3.1: Root Route, Home View, and Layout View

1. Run your application: `ruby app.rb` and go to localhost:4567 in your browser... Sinatra doesn't know this ditty.

  - First just define the route in the General Routes section of app.rb as described by Sinatra:
    ```ruby
    get '/' do
      "Hello World"
    end
    ```
  Now head back to localhost:4567 and check it out!

  - So maybe not super exciting but moving in the right direction

  - Replace `"Hello World"` with HTML rendered from an ERB template, home. Our General Routes section of app.rb now reads:
    ```ruby
    get '/' do
      erb :home
    end
    ```
    Back to the browser!

- Read the error and try to understand what it is saying: __No such file or directory @ rb_sysopen - /path/to/tunr_sinatra/views/home.erb__

    - When you look at our working directory (__tunr_sinatra/__), there is no __views/__ directory!

    - Make that directory and add a file home.erb.

    - In home.erb, first add a simple heading so you know that the HTML is rendering (check out localhost:4567)

- Now add a layout.erb file which will be shared by all of your app's pages (in the below steps, regularly checkout localhost:4567 and reflect on the effects of your code changes)

    - As always, start simple, maybe just a heading.

    - Then expand adding head and body elements, layout.erb should compile into well formed HTML

    - Create a __public__ directory in the root of your project. By default, Sinatra looks for static assets in a directory named __public__ in the root directory of the project. In the __public__ create a stylesheet.

    - Back in layout.erb add a link to your stylesheet in the head. In the body add a nav element containing links to '/artists' and '/songs'. Finally below the nav element, add an embedded ruby expression calling `yield`.

    - Take a moment to look at how the HTML rendered in from home.erb nests into the HTML rendered from layout.erb where we included `<%= yield %>`. That's pretty neat.

    - Now take a minute to make the home page your own

### Part 3.2: Artist Controller and Views

1. Make a __controllers/__ directory in __tunr_sinatra/__ and create a file __artists.rb__ which will hold the routes for your artists

  - We have talked about CRUD operations as covering most of what we want to do with data: Create, Read, Update, and Destroy.

  - You want to allow your user means to perform these four operations on the artists in your database. In this section you will define seven routes for artists which allow your user to perform these actions:

    1. Index (index all artists) - GET "/artists"

    2. Show (show particular artist) - GET "/artist/:id"

    3. New (render form to create new artists) - GET "/artists/new"

    4. Edit (render form to edit existing artist) - GET "/artists/:id/edit"

    5. Create (submit form to create new artist) - POST "/artists"

    6. Update (submit form to update existing artist) - PUT "/artists/:id"

    7. Destroy (delete an existing artist) - DELETE "/artists/:id"

- Make your __Index__ route for artists

  - In the browser, try to follow the link to "/artists" in your nav bar. And... Sinatra doesn't know this ditty. Not shocking as you have not yet defined it.

  - Instead of defining the route Sinatra suggests:
    ```ruby
    get "/artists" do
      "Hello World"
    end
    ```
  in our General Routes section of app.rb, we define it in our controllers/artists.rb file

  - Try to follow the link again and... oh no! Why doesn't Sinatra know this ditty? There is a very helpful comment in app.rb regarding loading controllers but there is no code there! Add the line:
    ```ruby
    require_relative 'controllers/artists.rb'
    ```
  to this section.

  - Checkout the browser again and see the greeting "hello world"

- Make your __Index__ view for artists.

  - Now we want to serve a more exciting response.

  - In the artist index route, replace `"Hello World"` with `erb :"artists/index"`. Head back to the browser to checkout the new error.

  - This is very similar to the error we saw before, but now Sinatra is looking for `/path/to/tunr_sinatra/views/artists/index.erb` so make that artists directory inside of the views directory, and create the file index.erb in the views/artists directory

  - As home.erb did, the artist/index.erb template will render nested within our layout.erb template
