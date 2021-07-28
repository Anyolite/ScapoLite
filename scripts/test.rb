puts "Running..."

game = ScapoLite::Game.new

game.field.fill_with_objects
game.add_hamster(x: 10, y: 10)
game.field.hard_clear_screen

game.draw

while true
  game.update
  game.draw

  if rand < 0.1
    rx = rand(game.field.width)
    ry = rand(game.field.height)

    entity = ScapoLite::Entity.new(entity_type: ScapoLite::Entity::TYPE_GEM)
    game.field.add_entity(entity: entity, x: rx, y: ry) unless game.field.get_entity(x: rx, y: ry)
  end
end