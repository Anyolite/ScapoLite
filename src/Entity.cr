module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Entity
    @[Anyolite::ExcludeInstanceMethod("colorize")]
    struct Type
      property color_code : Int32
      property str : String
      property solid : Bool

      def initialize(@color_code : Int32 = ScapoLite::COLOR_CODE_BLACK, @str : String = "  ", @solid : Bool = false)
      end
    end

    TYPE_HAMSTER = Type.new(color_code: COLOR_CODE_YELLOW, str: "🐹", solid: true)
    TYPE_TREE = Type.new(color_code: COLOR_CODE_GREEN, str: "🌳", solid: true)
    TYPE_GEM = Type.new(color_code: COLOR_CODE_BLUE, str: "💎")

    property entity_type : Type

    def initialize(@entity_type : Type)
    end
  end
end