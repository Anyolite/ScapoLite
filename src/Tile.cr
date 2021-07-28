module ScapoLite
  class Field
    @[Anyolite::ExcludeConstant("COLOR_CODES")]
    @[Anyolite::ExcludeInstanceMethod("colorize")]
    class Tile
      @[Anyolite::ExcludeInstanceMethod("colorize")]
      struct Type
        property color_code : Int32

        def initialize(@color_code : Int32 = ScapoLite::COLOR_CODE_BLACK)
        end
      end

      TYPE_GRASS = Type.new(color_code: COLOR_CODE_LIGHT_GREEN)
      TYPE_DIRT = Type.new(color_code: COLOR_CODE_DARK_GRAY)

      property tile_type : Type

      def initialize(@tile_type : Type)
      end

      def update

      end
    end
  end
end