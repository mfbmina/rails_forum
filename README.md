# README

This project is a small forum app.

Link to app: https://mfbmina-forum.herokuapp.com/

## Ruby version

2.4.2

## System dependencies

- Postgres
- Yarn
- Gems listed on Gemfile
- JS libs listed on package.json
- PhantomJS (for the test suit)

## Setup

### Clone the project

`$ git clone https://github.com/mfbmina/rails_forum`

### Move to the directory

`$ cd rails_forum`

### Installing dependencies

- `$ gem install bundler`
- `$ bundle`
- `$ yarn install`

### Database setup

- `$ rails db:create`
- `$ rails db:migrate`

### Run local server

`$ rails s`

### Run the test suite

`$ rspec spec/`
