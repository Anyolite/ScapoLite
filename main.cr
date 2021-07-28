require "anyolite"
require "colorize"

require "./src/Tile.cr"
require "./src/Entity.cr"
require "./src/Field.cr"
require "./src/Game.cr"
require "./src/Utility.cr"

Anyolite::RbInterpreter.create do |rb|
  Anyolite.wrap(rb, ScapoLite)
  rb.load_script_from_file("scripts/test.rb")
end
