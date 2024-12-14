# RailsPropertyManager

## Running Application

`[$]> bin/dev`

`[$]> bin/rails db:setup`

http://127.0.0.1:3000

## Initial Project Creation Steps

### Set Ruby Version

Current Latest: `Ruby 3.3.6`

`[$]> echo $(rbenv install --list | grep -v - | tail -1) > .ruby-version`

### Install Ruby Version

`[$]> rbenv install --skip-existing`

### Install Rails

`[$]> gem install rails`

### Initialize Rails Application

`[$]> rails new . -c tailwind -d mysql`

### Setup Docker Compose (MySQL)

`[$]> touch compose.yaml`

### Generate Database Models (Property, Unit)

`[$]> rails generate model Property address:string city:string state:string`

`[$]> rails generate model Unit property:references bedroom_count:integer bathroom_count:integer square_footage:integer rent_price:decimal{'8,2'}`
