module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Entity
    @[Anyolite::ExcludeInstanceMethod("colorize")]
    struct Type
      property color_code : Int32 = COLOR_CODE_BLACK
      property str : String = " "

      def initialize(@color_code : Int32, @str : String)
      end
    end

    TYPE_ROCK = Type.new(color_code: COLOR_CODE_BLACK, str: "O")

    property entity_type : Type

    def initialize(@entity_type : Type)
    end
  end
end