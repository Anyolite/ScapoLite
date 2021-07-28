module ScapoLite
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  class Game
    property field : Field
    
    def initialize
      @field = Field.new
    end

    def update
      @field.update
    end

    def draw
      @field.draw
    end
  end
end