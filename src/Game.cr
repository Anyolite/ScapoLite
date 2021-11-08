module ScapoLite
  class Game
    property field : Field
    property hamster : Entity
    property score : Int32 = 0

    enum Direction
      UP
      DOWN
      LEFT
      RIGHT
    end

    def initialize(field_width : Int32 = 20, field_height : Int32 = 20)
      @field = Field.new(width: field_width, height: field_height)
      @hamster = Entity.new(entity_type: Entity::TYPE_HAMSTER)
      @hamster_x = 10
      @hamster_y = 10
      @hamster_active = false
    end

    def add_hamster(x : Int32, y : Int32)
      @hamster_x = x
      @hamster_y = y
      @hamster_active = true

      if !@field.in_bounds?(x, y)
        raise "Invalid hamster coords: #{x} #{y}"
      end

      @field.add_entity(@hamster, x: @hamster_x, y: @hamster_y)
    end

    def update
      @field.update

      key = read_keypress

      case key
        when :q then exit
        when :ctrl_c then exit
        when :escape then exit
        when :up then try_to_move_hamster(Direction::UP)
        when :down then try_to_move_hamster(Direction::DOWN)
        when :left then try_to_move_hamster(Direction::LEFT)
        when :right then try_to_move_hamster(Direction::RIGHT)
      end
    end

    def try_to_move_hamster(direction : Direction)
      return if !@hamster_active

      hamster_entity = @field.get_entity(x: @hamster_x, y: @hamster_y)

      return if !hamster_entity

      case direction
        when Direction::UP then target = {@hamster_x, @hamster_y - 1}
        when Direction::DOWN then target = {@hamster_x, @hamster_y + 1}
        when Direction::LEFT then target = {@hamster_x - 1, @hamster_y}
        when Direction::RIGHT then target = {@hamster_x + 1, @hamster_y}
        else raise "Invalid direction argument: #{direction}"
      end

      if @field.in_bounds?(x: target[0], y: target[1])
        entity_ahead = @field.get_entity(x: target[0], y: target[1])

        unless entity_ahead && entity_ahead.entity_type.solid
          entity_ahead.contact_with_hamster(hamster_entity) if entity_ahead
          @field.move_entity(from_x: @hamster_x, from_y: @hamster_y, to_x: target[0], to_y: target[1])
          @hamster_x = target[0]
          @hamster_y = target[1]
        end
      else
        nil
      end
    end

    def draw
      @field.draw
    end

    # Stolen from the 2048.cr sample for Crystal
    def read_keypress
      STDIN.raw do |io|
        buffer = Bytes.new(3)
        bytes_read = io.read(buffer)
        return :unknown if bytes_read == 0
        input = String.new(buffer[0, bytes_read])

        case input
        when "\e[A", "w"
          :up
        when "\e[B", "s"
          :down
        when "\e[C", "d"
          :right
        when "\e[D", "a"
          :left
        when "\e"
          :escape
        when "\u{3}"
          :ctrl_c
        when "q", "Q"
          :q
        else
          :unknown
        end
      end
    end
  end
end