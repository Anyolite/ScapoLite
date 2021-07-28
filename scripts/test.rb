puts "Running..."

game = ScapoLite::Game.new

while true
  game.update
  game.draw
  if rand < 0.000001
    rx = rand(ScapoLite::Field::WIDTH)
    ry = rand(ScapoLite::Field::HEIGHT)
    tile = ScapoLite::Field::Tile::TYPE_DIRT
    game.field.get_tile(x: rx, y: ry).tile_type = tile

    entity = ScapoLite::Entity.new(entity_type: ScapoLite::Entity::TYPE_ROCK)
    game.field.add_entity(entity: entity, x: rx, y: ry)
    
    game.field.needs_refresh = true
  end
end