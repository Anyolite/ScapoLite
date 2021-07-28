module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Field
    @tiles = [] of Array(Tile)
    @entities = [] of Array(Entity?)

    WIDTH = 21
    HEIGHT = 21

    def initialize
      0.upto(HEIGHT - 1) do |y|
        @tiles.push([] of Tile)
        @entities.push([] of Entity?)
        0.upto(WIDTH - 1) do |x|
          @tiles[y].push(Tile.new(tile_type: Tile::TYPE_DIRT))
          if rand < 0.1
            @entities[y].push(Entity.new(entity_type: Entity::TYPE_TREE))
          else
            @entities[y].push(nil)
          end
        end
      end
    end

    def update
    end

    def in_bounds?(x : Int32, y : Int32)
      (0 .. WIDTH - 1).includes?(x) && (0 .. HEIGHT - 1).includes?(y)
    end

    def get_tile(x : Int32, y : Int32)
      @tiles[y][x]
    end

    def get_entity(x : Int32, y : Int32)
      @entities[y][x]
    end

    def add_entity(entity : Entity?, x : Int32, y : Int32)
      @entities[y][x] = entity
    end

    def remove_entity(x : Int32, y : Int32)
      @entities[y][x] = nil
    end

    def move_entity(from_x : Int32, from_y : Int32, to_x : Int32, to_y : Int32)
      entity = get_entity(x: from_x, y: from_y)

      add_entity(entity: entity, x: to_x, y: to_y)
      remove_entity(x: from_x, y: from_y)
    end

    def draw
      clear_screen
      0.upto(HEIGHT - 1) do |y|
        0.upto(WIDTH - 1) do |x|
          entity = get_entity(x: x, y: y)

          bg_color = COLOR_CODES[get_tile(x: x, y: y).tile_type.color_code]
          fg_color = entity ? COLOR_CODES[entity.entity_type.color_code] : :white

          color = Colorize.with.fore(fg_color).on(bg_color)
          color.surround do
            print entity ? entity.entity_type.str : "  "
          end
        end
        print "\n"
      end
    end

    def clear_screen
      print "\e[2J\e[1;1H"
    end
  end
end