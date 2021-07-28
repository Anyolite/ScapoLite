puts "Running..."

game = ScapoLite::Game.new

game.draw

while true
  game.update
  game.draw

  if rand < 0.1
    rx = rand(ScapoLite::Field::WIDTH)
    ry = rand(ScapoLite::Field::HEIGHT)

    entity = ScapoLite::Entity.new(entity_type: ScapoLite::Entity::TYPE_GEM)
    game.field.add_entity(entity: entity, x: rx, y: ry) unless game.field.get_entity(x: rx, y: ry)
  end
end