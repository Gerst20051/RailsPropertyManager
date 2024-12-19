# RailsPropertyManager

## Install Dependencies (Ruby & Gems)

`[$]> rbenv install --skip-existing`

`[$]> bundle install`

## Running Application

`[$]> bin/dev`

`[$]> bin/rails db:setup`

http://127.0.0.1:3000

## Linting

`[$]> be rubocop -a`

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

### Generate Controllers (Properties, Units)

`[#]> rails generate controller Properties`

`[#]> rails generate controller Units`

### Add Deleted At Field To Database Tables

`[$]> bundle add acts_as_paranoid`

`[$]> rails generate migration add_deleted_at_to_property deleted_at:datetime:index`

`[$]> rails generate migration add_deleted_at_to_unit deleted_at:datetime:index`

`[$]> rails db:migrate`

### Install Faker Gem

`[$]> bundle add faker`
