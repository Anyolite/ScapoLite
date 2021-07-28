require "anyolite"

Anyolite::RbInterpreter.create do |rb|
  rb.load_script_from_file("scripts/game.rb")
end
