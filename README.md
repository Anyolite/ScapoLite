# ScapoLite

## Introduction

ScapoLite is a demo game, which is designed to show the capabilities of Anyolite.

Link to Anyolite: https://github.com/Anyolite/Anyolite.

## Information

In this game, you play a gem-loving hamster named Jacinth.
Currently, there is not much to do yet, but at least you can collect some of the gems.

However, the main purpose of ScapoLite is not to play some simple Rogue-like.
ScapoLite aims to demonstrate how easily Anyolite can be embedded into a project.

Play around with this project as much as you want! 

Every single class and public function can be accessed from the embedded mruby interpreter,
so the test script can be expanded in many ways.

Possible things to do (hard mode: try NOT to modify the crystal source code):
* Change the field size or the hamster starting position
* Add more objects to the field
* Add a custom entity or tile to the field

## Controls

Control the hamster with WASD or arrow keys. Quit the game with ESCAPE, Q or CTRL+C.

## Installation and running

Make sure to have Crystal installed (including shards). Then, run `shards install`,
compile the game using `crystal build main.cr` and finally run `./main` to start it.

## Roadmap

### Version 0.1.0

#### Features

* [X] Basic structure
* [ ] Score
* [ ] Better usage of scripts (e.g. callbacks for events)

#### Known bugs

* [ ] Characters might leak out of the field if keys are pressed down
