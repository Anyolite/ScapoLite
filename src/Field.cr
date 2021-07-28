module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Field
    @tiles = [] of Array(Tile)
    @entities = [] of Array(Entity?)
    
    property needs_refresh : Bool

    WIDTH = 40
    HEIGHT = 20

    def initialize
      0.upto(HEIGHT - 1) do |y|
        @tiles.push([] of Tile)
        @entities.push([] of Entity?)
        0.upto(WIDTH - 1) do |x|
          @tiles[y].push(Tile.new(tile_type: Tile::TYPE_GRASS))
          @entities[y].push(nil)
        end
      end

      @needs_refresh = true
    end

    def update
    end

    def get_tile(x : Int32, y : Int32)
      @tiles[y][x]
    end

    def get_entity(x : Int32, y : Int32)
      @entities[y][x]
    end

    def add_entity(entity : Entity, x : Int32, y : Int32)
      @entities[y][x] = entity
    end

    def draw
      if @needs_refresh
        clear_screen
        0.upto(HEIGHT - 1) do |y|
          0.upto(WIDTH - 1) do |x|
            entity = get_entity(x: x, y: y)

            bg_color = COLOR_CODES[get_tile(x: x, y: y).tile_type.color_code]
            fg_color = entity ? COLOR_CODES[entity.entity_type.color_code] : :white

            color = Colorize.with.fore(fg_color).on(bg_color)
            color.surround do
              print entity ? entity.entity_type.str : " "
            end
          end
          print "\n"
        end
        @needs_refresh = false
      end
    end

    def clear_screen
      print "\e[2J\e[1;1H"
    end
  end
end