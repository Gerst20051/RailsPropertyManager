# RailsPropertyManager

## Running Application

`[$]> docker compose up`

`[$]> bin/rails db:setup`

`[$]> bin/rails db:migrate`

`[$]> bin/dev`

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
