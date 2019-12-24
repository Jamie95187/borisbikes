# Boris Bikes

A system for the Boris Bikes of London, users can dock and hire bikes from docking stations.

## Setting up

### Cloning the repository

To clone the repository, navigate to the path that you would like the repository to be stored and type the following:

`git clone https://github.com/Jamie95187/borisbikes.git`

### Installing the gems

Use the following command to install the gems:

`bundle install`

## Testing

For the unit testing, you can type `rspec` in the root directory for this project.

Feature tests can be run on an online repl, `irb` or `pry` in terminal.

Used rubocop as linter. This can be used by typing `rubocop` in the project's root directory.

## User Stories & Domain Models

As a person,<br>
So that I can use a bike,<br>
I'd like a docking station to release a bike.

As a person,<br>
So that I can use a good bike,<br>
I'd like to see if the bike is working.

As a member of the public <br>
So I can return the bikes I've hired <br>
I want to dock my bike at the docking station

As a member of the public <br>
So I can decide whether to use the docking station <br>
I want to see if the bike has been docked

As a member of the public <br>
So that I am not confused and charged unnecessarily. <br>
I'd like docking stations to not release bikes when there are none available.

As a maintainer of the system <br>
So that I can control the distributions of bikes <br>
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer <br>
So that I can plan the distributions of bikes <br>
I want a docking station to have a default capacity of 20 bikes

As a system maintainer <br>
So that busy areas can be served more effectively <br>
I want to be able to specify a larger capacity when necessary.

| **Object** | **Messages** |
|--- | --- |
| User | |
| Bike | working? |
| Docking Station | release_bike |

| **Object** | **Messages |
| --- | --- |
| User | |
| Docking Station | dock_bike |
| | bikes |
