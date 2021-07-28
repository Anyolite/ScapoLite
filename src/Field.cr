module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Field
    @[Anyolite::ExcludeConstant("COLOR_CODES")]
    @[Anyolite::ExcludeInstanceMethod("colorize")]
    class Tile
      COLOR_CODES = [
        :black, :red, :green, :yellow, 
        :blue, :magenta, :cyan, 
        :light_gray, :dark_gray, 
        :light_red, :light_green, :light_yellow, :light_blue, 
        :light_magenta, :light_cyan, 
        :white
      ]

      COLOR_CODE_BLACK = 0
      COLOR_CODE_RED = 1
      COLOR_CODE_GREEN = 2
      COLOR_CODE_YELLOW = 3
      COLOR_CODE_BLUE = 4
      COLOR_CODE_MAGENTA = 5
      COLOR_CODE_CYAN = 6
      COLOR_CODE_LIGHT_GRAY = 7
      COLOR_CODE_DARK_GRAY = 8
      COLOR_CODE_LIGHT_RED = 9
      COLOR_CODE_LIGHT_GREEN = 10
      COLOR_CODE_LIGHT_YELLOW = 11
      COLOR_CODE_LIGHT_BLUE = 12
      COLOR_CODE_LIGHT_MAGENTA = 13
      COLOR_CODE_LIGHT_CYAN = 14
      COLOR_CODE_WHITE = 15

      @[Anyolite::ExcludeInstanceMethod("colorize")]
      struct Type
        property color_code : Int32 = COLOR_CODE_BLACK

        def initialize(@color_code : Int32)
        end
      end

      TYPE_GRASS = Type.new(color_code: COLOR_CODE_LIGHT_GREEN)
      TYPE_DIRT = Type.new(color_code: COLOR_CODE_DARK_GRAY)

      property tile_type : Type = TYPE_GRASS

      def initialize(@tile_type : Type)
      end

      def update

      end

      def draw
        Colorize.with.back(COLOR_CODES[@tile_type.color_code]).surround do
          print "X"
        end
      end
    end

    @background = [] of Array(Tile)
    
    property needs_refresh : Bool

    WIDTH = 40
    HEIGHT = 20

    def initialize
      0.upto(HEIGHT - 1) do |y|
        @background.push([] of Tile)
        0.upto(WIDTH - 1) do |x|
          @background[y].push(Tile.new(tile_type: Tile::TYPE_GRASS))
        end
      end

      @needs_refresh = true
    end

    def update
    end

    def get_tile(x : Int32, y : Int32)
      @background[y][x]
    end

    def draw
      if @needs_refresh
        clear_screen
        0.upto(HEIGHT - 1) do |y|
          0.upto(WIDTH - 1) do |x|
            get_tile(x: x, y: y).draw
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