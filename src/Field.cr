module ScapoLite
  class Field
    @tiles = [] of Array(Tile)
    @entities = [] of Array(Entity?)

    property width : Int32
    property height : Int32

    def initialize(@width : Int32, @height : Int32)
    end
    
    def fill_with_objects
      0.upto(@height - 1) do |y|
        @tiles.push([] of Tile)
        @entities.push([] of Entity?)
        0.upto(@width - 1) do |x|
          new_tile_type = (rand < 0.5 ? Tile::TYPE_DIRT : Tile::TYPE_GRASS)

          @tiles[y].push(Tile.new(tile_type: new_tile_type))

          if rand < 0.5 && new_tile_type == Tile::TYPE_GRASS
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
      (0 .. @width - 1).includes?(x) && (0 .. @height - 1).includes?(y)
    end

    # TODO: Check for bounds in these functions

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
      soft_clear_screen
      0.upto(@height - 1) do |y|
        0.upto(@width - 1) do |x|
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

    # Clears everything
    def hard_clear_screen
      print "\e[2J\e[1;1H"
    end

    # Overwrites old screen
    def soft_clear_screen
      print "\e[1;1H"
    end
  end
end