# Rovers

This is a gem to run a simulation of rovers on a plateau on Mars' surface.

## Installation

Since this isn't a proper gem, you can just run it locally. Clone the repository:

    $ git clone http://github.com/judy/rovers.git

Then add this line to your application's Gemfile, modifying the location:

    gem 'rovers', path: "location/to/the/rovers/directory"

## Specs

Clone the git repository to your local development machine. Then install the gems:

    $ bundle

And run the specs:

    $ rspec spec/

Guard is also used for live reloading of specs. You can just run guard:

    $ guard

## Usage

Require the main "rovers" library. Then pass a string into the InputProcessor.process method. Use the following format:

### Input

    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM

### Output

    1 3 N
    5 1 E

