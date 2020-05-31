## Building the rails App

1. Run `docker-compose build` after every Gemfile change or to build the containers

## Running the rails App

1. Run `docker-compose up` to run the rails app
2. hit `http://0.0.0.0:3000`

## Debugging the Rails App

1. Add `binding.pry` or `byebug` in your code where you want to put the breakpoint.
2. Run `docker-compose run --service-port --rm web` in your console to run the rails app in Debug mode
3. Access the endpoint you are debugging to go into debugging mode in pry or byebug

## Rails CHEATSHEET using docker

1. `docker-compose run --rm web rails new . --force --no-deps --database=postgresql`
2. `docker-compose run --rm web bundle install`
3. `docker-compose run --rm web bundle update`
4. `docker-compose run --rm web rails db:create`
5. `docker-compose run --rm web rails db:migrate`
6. `docker-compose run --rm web rails db:drop`
7. `docker-compose run --rm web rails assets:precompile`
8. `docker-compose run --rm web rails console`
9. `docker-compose run --rm web rails test`

## Student Name: Yuhao Liu Student Number: s3653114

## The highest level I attempted: 80+ level

## Time sheet: individual assignment so all the work done by myself

## Heroku deployment URL: https://s3653114-radassignment.herokuapp.com/

## The last Heroku deployment log:
