# Boris Bikes

A system for the Boris Bikes of London, users can dock and hire bikes from docking stations.

## Setting up

### Cloning the repository

To clone the repository, navigate to the path that you would like the repository to be stored and type the following:

`git clone https://github.com/Jamie95187/borisbikes.git`

After cloning the repository enter the root directory for the project

`cd borisbikes`

### Installing the gems

Use the following command to install the gems:

`bundle install`

## Testing

For the unit testing, you can type `rspec` in the root directory for this project.

Feature tests can be run on an online repl, `irb` or `pry` in terminal. Refer to the image below to see how to feature test in `pry`

<img src="./images/Screen 2019-12-29 at 22.07.49.png" width="400"/>

Used rubocop as linter. This can be used by typing `rubocop` in the project's root directory.

The test coverage is shown in the terminal when typing `rspec`.

### Gems used

pry - alternative to irb (used for feature testing the system) <br>
rspec - used for unit testing the model <br>
rubocop - linter used to write conventional ruby <br>
simplecov - to calculate test coverage over the project <br>
simplecov-console - to display the coverage onto the terminal

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

As a member of the public <br>
So that I reduce the chance of getting a broken bike in the future <br>
I'd like to return a broken bike when I return it

As a maintainer of the system <br>
So I can manage broken bikes and not disappoint the users <br>
I'd like docking stations to not release broken bikes

As a maintainer of the system <br>
So I can manage broken bikes and not disappoint the users <br>
I'd like the docking stations to accept returning bikes (broken or not).

As a maintainer of the system <br>
So that I can manage broken bikes and not disappoint users <br>
I'd like vans to take broken bikes from the docking stations and deliver them to garages to be fixed.

As a maintainer of the system <br>
So that I can manage broken bikes and not disappoint users <br>
I'd like vans to collect working bikes from garages and distribute them to docking stations.

| **Object** | **Messages** |
|--- | --- |
| User | |
| Bike | working? |
| | report_broken |
| Docking Station | dock_bike |
| | release_bike |
| | capacity |
| Van | collect |
| | deliver |
| Garage | bikes |
