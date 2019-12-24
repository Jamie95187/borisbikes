# Boris Bikes

A system for the Boris Bikes of London, users can dock and hire bikes from docking stations.

## Setting up

### Cloning the repository

To clone the repository, navigate to the path that you would like the repository to be stored and type the following:

`git clone https://github.com/Jamie95187/borisbikes.git`

### Installing the gems

Use the following command to install the relevant gems:

`bundle install`

## Testing

For the unit testing type `rspec` in the root directory for this project. Feature tests can be run on an online repl or use irb in terminal.

Used rubocop as linter. This can be used by typing `rubocop` in the project's root directory.

## User Stories & Domain Models

As a person,<br>
So that I can use a bike,<br>
I'd like a docking station to release a bike.

As a person,<br>
So that I can use a good bike,<br>
I'd like to see if the bike is working.

| **Object** | **Messages** |
|--- | --- |
| User | |
| Bike | is_working? |
| Docking Station | release_bike |
