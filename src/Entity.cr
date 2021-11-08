module ScapoLite
  class Entity
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

    @on_contact : Anyolite::RbRef? = nil

    # This demonstrates one of the most powerful features of Anyolite:
    # The ability to store Ruby closures in a simple variable.
    # The Anyolite::StoreBlockArg annotation stores the block argument internally,
    # which then can be recalled using Anyolite.obtain_given_rb_block.
    @[Anyolite::StoreBlockArg]
    @[Anyolite::ReturnNil]
    def on_contact
      @on_contact = Anyolite.obtain_given_rb_block
    end

    # One restriction is what block arguments are given.
    # Here, the hamster and the entity are the most useful ones.
    # Other content is still possible due to the closure nature of the blocks passed.
    def contact_with_hamster(hamster : Entity)
      if @on_contact
        Anyolite.call_rb_block(@on_contact, [hamster, self])
      end
    end

    def initialize(@entity_type : Type)
    end
  end
end